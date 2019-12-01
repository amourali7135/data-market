class Buyer < ApplicationRecord

  belongs_to :user
  has_many :inquiries
  has_many :payments
  has_many :reviews

end
