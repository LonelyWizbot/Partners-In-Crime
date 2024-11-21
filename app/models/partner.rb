class Partner < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true
end
