class EditAcceptedInInquiry < ActiveRecord::Migration[5.2]
  def change
    rename_column :inquiries, :accept?, :accept  
  end
end
