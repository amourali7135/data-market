class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  has_one :seller, dependent: :destroy
  has_one :buyer, dependent: :destroy
  has_many :data, through: :seller, dependent: :destroy
  has_many :inquiries, through: :buyer, dependent: :destroy
  has_many :orders, through: :buyer, dependent: :destroy
  # has_many :trades, through: :data, dependent: :destroy

  Datum = 'test'
end
