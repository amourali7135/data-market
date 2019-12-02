class Seller < ApplicationRecord
  belongs_to :user
  has_many :data

  # validate presence of anything?
  #above age 18!!!

  def self.sex
    ['Male', 'Female' ]
  end

  def self.ethnicity #lots, shit
    ['', 'Female' ].sort
  end

  def self.race #lots, shit
    ['White', 'Black/African-American', 'Latin American', 'Asian', 'Middle Eastern', 'Native American',  ].sort
  end

  def self.religion
    ['Christian', 'Muslim', 'Jewish', 'Hindu', 'Buddhist', 'Atheist', 'Agnostic', '' ].sort
  end

  def self.sexuality
    ['Straight/Heterosexual', 'Gay/Homosexual', 'Bisexual', 'Asexual', 'Transsexual', 'Other', 'Unsure', 'Pansexual', '' ].sort
  end

  def self.politics
    ['Moderate', 'Liberal', 'Very Liberal', 'Conservative', 'Very Conservative', 'Other', 'Apolitical' ].sort
  end

  def self.relationship_status
    ['Single', 'In a relationship', 'Married', 'Divorced', 'Engaged',  ].sort
  end

  def self.education_level
    ['Did not finish high school', 'High School Graduate', 'Some College', 'Undergraduate Degree', 'Associates Degree', 'Graduate/Masters Degree', 'Professional Degree', 'Doctorate Degree', 'Technical/Trade School', 'In College', 'In Grad School', 'In Trade/Tech School',  ].sort
  end

  def self.occupation #Be broad.
    ['Teacher', 'Academia',  ].sort
  end
end
