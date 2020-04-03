class ChangeInquiryActiveToDateTime < ActiveRecord::Migration[5.2]
  def change
    # rename_column :inquiries, :active, :ongoing
    remove_column :inquiries, :active
    # change_column :inquiries, :ongoing, :datetime
    add_column :inquiries, :active, :datetime
  end
end
