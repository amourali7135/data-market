class Seller < ApplicationRecord
  belongs_to :user
  has_many :data, dependent: :destroy
  has_many :inquiries, optional: true

  # validate presence of anything?
  #above age 18!!!
  validates :age, presence: true
  validates :types, presence: true
  validates :sex, presence: true
  validates :country, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :age, :country, :sex, :occupation, :city, :income, :ethnicity, :race, :religion, :sexuality, :politics, :relationship_status, :children, :verified, :birth_country, :smoker, :education_level, :types  ],
  # associated_against: {
  #   director: [ :first_name, :last_name ]
  # },
  using: {
    tsearch: { prefix: true }
  }

  def self.sexes
    ['Male', 'Female', 'Other', ]
  end

  def self.ethnicity #lots, shit
    ['White', 'Black/African-American', 'Latin American', 'Asian', 'Middle Eastern', 'Native American', ].sort
  end

  def self.race #lots, shit
    ['White', 'Black/African-American', 'Latin American', 'Asian', 'Middle Eastern', 'Native American',  ].sort
  end

  def self.religion
    ['Christian', 'Muslim', 'Jewish', 'Hindu', 'Buddhist', 'Atheist', 'Agnostic', 'Spiritual' ].sort
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

  def self.types #Try here and calling data.types both!
    ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', 'Survey', 'Questionnaire', 'Poll',  ].sort
  end

end
