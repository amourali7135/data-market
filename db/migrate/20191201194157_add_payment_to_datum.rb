class AddPaymentToDatum < ActiveRecord::Migration[5.2]
  def change
    add_reference :data, :payment, index: true
  end
end
