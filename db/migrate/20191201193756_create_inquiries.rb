class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.text :information
      t.text :requirements
      t.text :usage
      t.text :reward
      t.boolean :anonymous
      t.references :buyer, foreign_key: true
      t.references :seller, foreign_key: true
      t.references :datum, foreign_key: true

      t.timestamps
    end
  end
end
