class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :deposit
      t.integer :amount
      t.string :status
      t.references :buyer, foreign_key: true
      t.references :transaction, foreign_key: true

      t.timestamps
    end
  end
end
