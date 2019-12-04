class Review < ApplicationRecord

  belongs_to :buyer
  belongs_to :trade

  validates :writeup, presence: true
  validates :rating, presence: true

end
