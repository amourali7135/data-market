class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  has_one :seller
  has_one :buyer
  has_many :data, through: :sellers, dependent: :destroy
  has_many :inquiries, through: :buyers, dependent: :destroy


end
