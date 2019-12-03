class Buyer < ApplicationRecord

  belongs_to :user
  has_many :inquiries, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :reviews
  has_many :transactions, through: :payments, dependent: :destroy

  validates :name, presence: true
  validates :biography, presence: true
  validates :intentions, presence: true
  validates :types, presence: true

  def self.types #Try here and calling data.types both!
    ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', '' ].sort
  end


end
