class Sellerinquiry < ApplicationRecord
  belongs_to :inquiry
  belongs_to :seller
  has_many :buyers, through: :inquiries
  
  validates :seller_id, uniqueness: true
  validates :inquiry_id, uniqueness: true
end
