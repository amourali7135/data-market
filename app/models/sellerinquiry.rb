class Sellerinquiry < ApplicationRecord
  belongs_to :inquiry
  belongs_to :seller
end
