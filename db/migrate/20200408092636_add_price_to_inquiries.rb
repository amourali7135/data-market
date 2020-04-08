class AddPriceToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_monetize :inquiries, :price, currency: { present: false }
  end
end
