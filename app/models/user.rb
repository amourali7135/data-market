class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  has_one :seller, dependent: :destroy
  has_one :buyer, dependent: :destroy
  has_many :data, through: :seller, dependent: :destroy #source needed?
  has_many :inquiries, through: :buyer, dependent: :destroy #source needed?
  has_many :orders, through: :buyer, dependent: :destroy #source needed?
  # has_many :trades, through: :data, dependent: :destroy  #I couldn't delete a user till I commented this out, why?

  Datum = 'test'
end
