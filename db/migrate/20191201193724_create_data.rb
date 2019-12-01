class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.string :format
      t.text :content
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
