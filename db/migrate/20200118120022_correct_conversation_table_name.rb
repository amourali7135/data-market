class CorrectConversationTableName < ActiveRecord::Migration[5.2]
  def change
    rename_column :conversations, :conversation_id, :receiver_id
  end
end
