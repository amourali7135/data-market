class DropSellerForeignKeyFromInquiries < ActiveRecord::Migration[5.2]
  def change
    remove_column :inquiries, :seller_id
  end
end
