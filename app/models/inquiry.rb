class Inquiry < ApplicationRecord
  acts_as_punchable

  belongs_to :buyer
  belongs_to :data, optional: true
  has_many :sellerinquiries, dependent: :destroy
  has_many :sellers, through: :sellerinquiries

  validates :requirements, presence: true
  validates :reward, presence: true
  # validates :anonymous, presence: true
  validates :total, presence: true #numericality: true
  validates :types, presence: true
  validates :information_usage, presence: true
  validates :format, presence: true
  validates :title, presence: true, uniqueness: true
  validates :instructions, presence: true

  scope :active, -> { where(Active = "nil") }  #is this even the right way?
  scope :hidden, -> { where(Hidden = "true") }
  scope :open, -> { where(Hidden = nil ) }
  scope :anonymous, -> { where(Anonymous = "false") }

  monetize :price_cents

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
