class AddCouponcodeToDownloads < ActiveRecord::Migration
  def self.up
    add_column :downloads, :couponcode, :text
  end

  def self.down
    remove_column :downloads, :couponcode
  end
end
