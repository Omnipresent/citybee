class AddIncludedToDownloads < ActiveRecord::Migration
  def self.up
    add_column :downloads, :influenced, :integer
  end

  def self.down
    remove_column :downloads, :influenced
  end
end
