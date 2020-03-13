class Order < ApplicationRecord
  belongs_to :buyer
  # belongs_to :trade

  validates :amount, presence: true

end
