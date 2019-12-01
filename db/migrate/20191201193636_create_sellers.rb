class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.integer :age
      t.string :country
      t.string :sex
      t.string :occupation
      t.string :city
      t.integer :income
      t.string :ethnicity
      t.string :race
      t.string :religion
      t.string :sexuality
      t.string :politics
      t.string :relationship_status
      t.string :politics
      t.boolean :children
      t.boolean :verified
      t.string :birth_country
      t.boolean :smoker
      t.string :education_level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
