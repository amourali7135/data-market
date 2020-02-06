class AddActiveToInquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :active, :boolean
  end
end
