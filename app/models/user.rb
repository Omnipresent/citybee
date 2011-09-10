class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :downloads
  has_many :deals, :through => :downloads
  has_many :coupons, :through => :downloads
  has_many :offers, :through => :downloads
  has_many :influences
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end



  def self.generate_coupon
    user_coupon_code = nil
    while user_coupon_code == nil
      potential_coupon = Coupon.where("times_allowed > ?", 0).order("random()").limit(1).first
      times_downloaded = Download.where("coupon_id = ?", potential_coupon.id).count
      if potential_coupon.times_allowed > times_downloaded
        user_coupon_code = potential_coupon.id
      end
    end
    user_coupon_code
  end

  def self.authenticate (email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.timesdownloaded (deal_id)

  end
end
