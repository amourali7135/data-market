class Sellerinquiry < ApplicationRecord
  belongs_to :inquiry
  belongs_to :seller
  has_many :buyers, through: :inquiries
  before_validation :full_house, on: :create
  before_validation :duplicates, on: :create


  # validates :seller_id, presence: true    #uniqueness: true
  # validates :inquiry_id, presence: true    #uniqueness: true
  # validates :seller_id, :inquiry_id, uniqueness: true
  # validates :zipcode, :uniqueness => {:scope => [:recorded_at, :something_else]}

  #HOW DO I LIMIT THE AMOUNT OF RECORDS FOR EACH INQUIRY TO THE TOTAL?
  #  Sellerinquiry.inquiry.total

  # def filled
  #   if self.where(inquiry_id: id )
  #     self.where(inquiry_id: )
  # end
  #  Notification.first.destroy if Notification.count > 50

  def full_house
    if Sellerinquiry.where(inquiry_id: inquiry.id).count == self.inquiry.total
      # if inquiry.sellerinquiries.count == inquiry.total  #Ray method, works too actually.
      self.inquiry.active = false
      self.inquiry.save
      puts "Your inquiry is full now!"
    end
  end

  def duplicates # fix this
    # if Sellerinquiry.where(inquiry_id: inquiry.id, seller_id: @seller.id).count == 2
    if Sellerinquiry.where(inquiry_id: inquiry.id, seller_id: seller.id).present?
    # if Sellerinquiry.where(inquiry_id: @inquiry.id, seller_id: @seller.id).present?

      end
    end


  end
