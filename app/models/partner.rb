class Partner < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 600, too_long: "600 caractères maximum" }
  validates :image, presence: true
  validates :price, presence: true
  validates :name, presence: true

  geocoded_by :address
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description, against: [ :title, :description ], using: {
    tsearch: { prefix: true }
  }
end
