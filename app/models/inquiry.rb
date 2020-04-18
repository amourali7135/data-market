class Inquiry < ApplicationRecord
  acts_as_punchable

  belongs_to :buyer
  belongs_to :data, optional: true
  has_many :sellerinquiries, dependent: :destroy
  has_many :sellers, through: :sellerinquiries
  # has_many :orders     Maybe?

  validates :requirements, presence: true
  validates :reward, presence: true
  # validates :anonymous, presence: true
  validates :total, presence: true #numericality: true
  validates :types, presence: true
  validates :information_usage, presence: true
  validates :format, presence: true
  validates :title, presence: true, uniqueness: true
  validates :instructions, presence: true

  scope :active, -> { where(Active = nil ) }  #is this even the right way?
  scope :finished, -> { where(Active = !nil ) }
  scope :hidden, -> { where(Hidden = "true") }
  scope :open, -> { where(Hidden = nil ) }
  scope :anonymous, -> { where(Anonymous = "false") }

  monetize :price_cents
  acts_as_taggable_on :tags

  #How the fuck to make this not be a spam like result?  Shit.

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :information_usage, :requirements, :reward, :types, ],
  associated_against: {
  tags: [ :name ]
},
using: {
tsearch: { prefix: true }
}

def self.types
  ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', 'Survey', 'Questionnaire', 'Poll', 'Photo', 'Software', 'Psychological', 'DNA/Genetic'  ].sort
end

def self.formats
  ['Document', 'Photo', 'PDF', 'File', 'Bill Statements', 'Software', 'Online history', 'Paperwork', 'Computer Data', 'Spreadsheet', 'Numbers', 'Questionannaire', 'Photocopy', 'Poll', 'Fitbit/Wearable', '' ].sort
end

def self.purpose
  ['Academic Research', 'Medical Research', 'Start-up Related Research', 'Business Research', 'Political Research', 'Scientific Research', 'Personal Use', 'Other', 'Curiosity', 'Advertising/Marketing Related Reasons', 'Product Development', 'Business Development', 'Sentiment Analysis', 'Transportation Research', 'Cultural Analysis', 'Financial Research', 'Consumer Sentiment', '']
end

def percentage_done
  @percentage = Sellerinquiry.where(inquiry_id: self.id).count / self.total
  @percentage
end

def self.tags
  [ 'Obese', 'Anorexic', 'HIV+', 'Diabetic', 'Sickle Cell Anemia', 'COPD', 'Cancer', 'Stroke', 'Heart Attack', 'Bankrupt Previously', 'Scoliosis', 'High Debt', 'Psychiatric Disorders', 'STD', 'Nationalist', 'Overweight', 'Auto-immune Disorder', 'Artist', 'Musician', ''].sort
end

# private

def full_house  #Where do I call this though for it to work?  Wait, do I need a button?
  if Sellerinquiry.where(inquiry_id: self.id).count = self.total
    self.inquiry.active = false #&& Sellerinquiry.where(inquiry_id: self.id).last.destroy
    self.save
    puts "Your inquiry is full now!"
  end
end  #callback

end
