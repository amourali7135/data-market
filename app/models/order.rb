class Payment < ApplicationRecord
  belongs_to :buyer
  belongs_to :transaction

  validates :amount, presence: true

end
