class AddInstructionsToInquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :instructions, :text
  end
end
