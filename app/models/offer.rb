class Offer < ActiveRecord::Base
  belongs_to :deal
  has_many :downloads
  has_many :users, :through =>:downloads
end
