class ChangeInfluencedByUserIdInInfluencesToInfluencedUserId < ActiveRecord::Migration
  def self.up
    remove_column :influences, :influenced_by_user_id
    add_column :influences, :influenced_used_id, :integer
  end

  def self.down
  end
end
