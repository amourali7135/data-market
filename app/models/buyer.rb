class Buyer < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :inquiries, dependent: :destroy
  has_many :trades, dependent: :destroy
  # has_many :trades, through: :orders,  dependent: :destroy
  has_many :reviews
  has_many :orders, dependent: :destroy #source order?

  validates :name, presence: true
  validates :biography, presence: true
  validates :intentions, presence: true
  validates :types, presence: true
  validates :country, presence: true
  #validates :website, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :biography, :intentions, :website, :types ],
    # associated_against: {
    #   director: [ :first_name, :last_name ]
    # },
    using: {
      tsearch: { prefix: true }
    }

  def self.types #Try here and calling data.types both!
    ['Medical', 'Financial', 'Personal', 'Business', 'Political', 'Internet', 'Phone', 'Google', 'Social Media', 'Life', 'Academic', 'Survey', 'Questionnaire', 'Poll', 'Photo', 'Software', 'Psychological',  ].sort
  end


end
