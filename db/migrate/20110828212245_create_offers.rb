class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :deal_id
      t.integer :price
      t.integer :value
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
