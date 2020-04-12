class DroppingRedundantTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :group_memberships
    drop_table :data_types
    drop_table :groups
    # drop_table :votes
  end
end
