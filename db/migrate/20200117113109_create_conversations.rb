class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :author
      t.references :conversation

      t.timestamps
    end
  end
end
