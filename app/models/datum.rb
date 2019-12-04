class Datum < ApplicationRecord

  belongs_to :seller
  # has_one :data_types #Sure?
  has_one :order
  has_many :trades, through: :data#, :source => :order #Is it one of seller or order?  Change if wrong.


  validates :format, presence: true
  validates :content, presence: true
  validates :types, presence: true

  def self.types #so many possibilities to keep adding
    ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', 'Survey' ].sort
  end

end
