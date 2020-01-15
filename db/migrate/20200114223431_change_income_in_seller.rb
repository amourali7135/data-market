class ChangeIncomeInSeller < ActiveRecord::Migration[5.2]
  def change
    change_column :sellers, :income, :string
  end
end
