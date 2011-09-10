class Download < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  belongs_to :coupon
  belongs_to :offer
end
