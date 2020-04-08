class AddSkuToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :sku, :string
  end
end
