class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.text :coupon_code
      t.integer :times_allowed

      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end
