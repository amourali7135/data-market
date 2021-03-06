class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.date :date
      t.integer :price
      t.references :datum, foreign_key: true
      t.references :inquiry, foreign_key: true

      t.timestamps
    end
  end
end
