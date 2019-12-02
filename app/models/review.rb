class Review < ApplicationRecord

  belongs_to :buyer
  belongs_to :transaction

  validates :writeup, presence: true
  validates :rating, presence: true

end
