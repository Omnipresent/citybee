class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :deal_id
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
