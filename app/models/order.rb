class Order < ApplicationRecord
  belongs_to :user
  belongs_to :inquiry
  monetize :amount_cents
  mount_uploader :photo, PhotoUploader
  validates :amount, presence: true

end
