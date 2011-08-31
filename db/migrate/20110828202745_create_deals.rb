class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.string :title
      t.integer :min_needed
      t.integer :max_allowed
      t.datetime :end_at
      t.text  :summary
      t.text  :fine_print
      t.timestamps
    end
  end

  def self.down
    drop_table :deals
  end
end
