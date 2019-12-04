class Trade < ApplicationRecord
  has_one :data
  has_one :inquiry

  validates :price, presence: true

end
