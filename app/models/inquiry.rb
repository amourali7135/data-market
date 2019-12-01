class Inquiry < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  belongs_to :data

end
