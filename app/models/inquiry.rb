class Inquiry < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller, optional: true #how to have multiple?
  belongs_to :data, optional: true

  validates :requirements, presence: true
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
