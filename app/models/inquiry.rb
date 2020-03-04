class Inquiry < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller, optional: true #how to have multiple?
  belongs_to :data, optional: true

  acts_as_votable

  validates :requirements, presence: true
  validates :reward, presence: true
  validates :anonymous, presence: true
  validates :total, presence: true, numericality: true
  validates :types, presence: true
  validates :information_usage, presence: true
  validates :format, presence: true
  validates :title, presence: true, uniqueness: true
  validates :instructions, presence: true

  groupify :group_member

  #How the fuck to make this not be a spam like result?  Shit.

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :information_usage, :requirements, :reward, :types,  ],
  # associated_against: {
  #   director: [ :first_name, :last_name ]
  # },
  using: {
    tsearch: { prefix: true }
  }

  def self.types
    ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', 'Survey', 'Questionnaire', 'Poll', 'Photo', 'Software', 'Psychological', 'DNA/Genetic'  ].sort
  end

  def self.formats
    ['Document', 'Photo' 'PDF', 'File', 'Bills', 'Software', 'Online', 'Paperwork', 'Spreadsheet', 'Numbers', 'Questionannaire',  ].sort
  end

  def self.purpose
    ['Academic Research', 'Medical Research', 'Start-up Research', 'Business Research', 'Political Research', '']
  end

  def maximum
    @max = self.total
  end

end
