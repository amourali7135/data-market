class Inquiry < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  belongs_to :data

  validates :requirements, presence: true
  validates :usage, presence: true
  validates :reward, presence: true
  validates :anonymous, presence: true
  validates :total, presence: true
  validates :types, presence: true
  validates :information_usage, presence: true

  #How the fuck to make this not be a spam like result?  Shit.

  def self.types #Try here and calling data.types both!
    ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', 'Survey' ].sort
  end
end
