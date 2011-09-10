class AddExpirationDateToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :expiration_date, :date
  end

  def self.down
    remove_column :deals, :expiration_date
  end
end
