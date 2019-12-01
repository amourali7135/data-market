class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.text :biography
      t.text :intentions
      t.string :website
      t.text :contact
      t.integer :size
      t.string :photo
      t.string :country
      t.string :city
      t.string :phone
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
