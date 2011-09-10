class CreateInfluences < ActiveRecord::Migration
  def self.up
    create_table :influences do |t|
      t.integer :user_id
      t.integer :download_id
      t.integer :influenced_by_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :influences
  end
end
