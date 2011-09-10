class AddImageNameToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :image_name, :string
  end

  def self.down
    remove_column :deals, :image_name
  end
end
