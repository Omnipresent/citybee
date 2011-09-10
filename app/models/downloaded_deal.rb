#remove this
class DownloadedDeal < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  belongs_to :coupons
end
