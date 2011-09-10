class AddCouponIdToDownloads < ActiveRecord::Migration
  def self.up
    add_column :downloads, :coupon_id, :integer
  end

  def self.down
    remove_column :downloads, :coupon_id
  end
end
