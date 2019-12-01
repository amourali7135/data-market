class Data < ApplicationRecord

  belongs_to :seller
  has_one :data_types #Sure?


end
