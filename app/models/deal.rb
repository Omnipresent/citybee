class Deal < ActiveRecord::Base
  attr_accessible :title, :min_needed, :max_allowed, :end_at, :summary, :fine_print, :offers_attributes, :locations_attributes, :featured_deal, :image_name
  has_many :locations, :dependent => :destroy
  has_many :offers, :dependent => :destroy
  has_many :downloads
  has_many :users, :through => :downloads



  accepts_nested_attributes_for :offers, :reject_if => lambda {|a| a[:title].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :locations, :reject_if => lambda {|a| a[:street_1].blank?}, :allow_destroy => true
end
