class AddHiddenToInquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :hidden, :boolean
  end
end
