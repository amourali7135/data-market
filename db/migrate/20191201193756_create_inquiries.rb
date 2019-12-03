class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.text :information_usage
      t.text :requirements
      t.text :reward
      t.boolean :anonymous
      t.integer :total
      t.string :types
      t.boolean :accept? #this can become a cluster fuck bro.
      t.references :buyer, foreign_key: true
      t.references :seller, foreign_key: true
      t.references :datum, foreign_key: true

      t.timestamps
    end
  end
end
