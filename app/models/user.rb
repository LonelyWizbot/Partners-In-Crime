class User < ApplicationRecord
  has_many :partners
  has_many :bookings
  has_many :partners, through: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  # validates :first_name, :last_name, :address, :zip_code, :city, presence: true
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be exactly 10 digits" }
end
