class SchemaTouchUps < ActiveRecord::Migration[5.2]
  def change
    change_column :inquiries, :title, :string
    remove_column :inquiries, :accept
    remove_column :buyers, :contact
    # rename_column :inquiries, :hidden, :public


  end
end
