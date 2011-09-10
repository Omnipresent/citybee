class Coupon < ActiveRecord::Base
  has_many  :downloads
  has_many  :users, :through=>:downloads
#    belongs_to :user
end
