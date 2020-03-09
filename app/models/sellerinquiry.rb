class Sellerinquiry < ApplicationRecord
  belongs_to :inquiry
  belongs_to :seller
  has_many :buyers, through: :inquiries
  
  # validates :seller_id, presence: true    #uniqueness: true
  # validates :inquiry_id, presence: true    #uniqueness: true
  # validates :seller_id, :inquiry_id, uniqueness: true
end
