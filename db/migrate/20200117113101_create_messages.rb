class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :read
      t.references :buyer
      t.references :seller
      t.references :conversation

      t.timestamps
    end
  end
end
