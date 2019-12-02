class Inquiry < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  belongs_to :data

  validates :information, presence: true
  validates :requirements, presence: true
  validates :usage, presence: true
  validates :reward, presence: true
  validates :anonymous, presence: true
  validates :total, presence: true
  validates :types, presence: true

  #How the fuck to make this not be a spam like result?  Shit.

end
