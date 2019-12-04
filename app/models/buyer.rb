class Buyer < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :inquiries, dependent: :destroy
  has_many :transactions, dependent: :destroy
  # has_many :transactions, through: :orders,  dependent: :destroy
  has_many :reviews
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :biography, presence: true
  validates :intentions, presence: true
  validates :types, presence: true
  validates :country, presence: true

  def self.types #Try here and calling data.types both!
    ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', 'Survey' ].sort
  end


end
