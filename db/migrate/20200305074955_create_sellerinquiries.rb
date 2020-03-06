class CreateSellerinquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :sellerinquiries do |t|
      t.datetime :completed
      t.references :seller, foreign_key: true
      t.references :inquiry, foreign_key: true
      t.timestamps
    end
  end
end
