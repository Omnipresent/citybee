class Deal < ActiveRecord::Base
  attr_accessible :title, :min_needed, :max_allowed, :end_at, :summary, :fine_print 
  has_many :locations, :dependent => :destroy
  has_many :offers, :dependent => :destroy

  def offer_attributes=(offer_attrubutes)
    offer_attrubutes.each do |attributes|
      offers.build(attributes)
    end
  end
end
