class Datum < ApplicationRecord

  belongs_to :seller
  # has_one :data_types #Sure?
  has_one :order
  # has_many :trades, through: :data, :source => :seller #Is it one of seller or order?  Change if wrong.  Or source trade?


  validates :format, presence: true
  validates :content, presence: true
  validates :types, presence: true

  def self.types #so many possibilities to keep adding
    ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', 'Survey', 'Questionnaire', 'Poll', 'Photo', 'Software', 'Psychological', 'DNA/Genetic' ].sort
  end

end
