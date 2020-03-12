class Sellerinquiry < ApplicationRecord
  belongs_to :inquiry
  belongs_to :seller
  has_many :buyers, through: :inquiries
  
  # validates :seller_id, presence: true    #uniqueness: true
  # validates :inquiry_id, presence: true    #uniqueness: true
  # validates :seller_id, :inquiry_id, uniqueness: true
  # validates :zipcode, :uniqueness => {:scope => [:recorded_at, :something_else]}
  
  #HOW DO I LIMIT THE AMOUNT OF RECORDS FOR EACH INQUIRY TO THE TOTAL?


end
