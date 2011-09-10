class AddMarkedUsedToDownloads < ActiveRecord::Migration
  def self.up
    add_column :downloads, :marked_used, :datetime
  end

  def self.down
    remove_column :downloads, :marked_used
  end
end
