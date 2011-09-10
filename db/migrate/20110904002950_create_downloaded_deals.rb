class CreateDownloadedDeals < ActiveRecord::Migration
  def self.up
    create_table :downloaded_deals do |t|
      t.integer :user_id
      t.integer :deal_id

      t.timestamps
    end
  end

  def self.down
    drop_table :downloaded_deals
  end
end
