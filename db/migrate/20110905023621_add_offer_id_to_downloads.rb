class AddOfferIdToDownloads < ActiveRecord::Migration
  def self.up
    add_column :downloads, :offer_id, :integer
  end

  def self.down
    remove_column :downloads, :offer_id
  end
end
