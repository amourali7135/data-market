class AddFormatToInquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :format, :string
  end
end
