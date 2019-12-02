class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  has_one :seller, dependent: :destroy
  has_one :buyer, dependent: :destroy
  has_many :data, through: :sellers, dependent: :destroy
  has_many :inquiries, through: :buyers, dependent: :destroy
  has_many :payments, through: :buyers, dependent: :destroy
  has_many :transactions, through: :data, dependent: :destroy


end
