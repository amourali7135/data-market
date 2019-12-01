class Transaction < ApplicationRecord
  has_one :data
  has_one :inquiry

end
