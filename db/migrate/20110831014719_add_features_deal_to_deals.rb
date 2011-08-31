class AddFeaturesDealToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :featured_deal, :boolean
  end

  def self.down
  end
end
