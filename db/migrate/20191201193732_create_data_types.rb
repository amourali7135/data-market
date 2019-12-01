class CreateDataTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :data_types do |t|
      t.string :name
      t.references :datum, foreign_key: true

      t.timestamps
    end
  end
end
