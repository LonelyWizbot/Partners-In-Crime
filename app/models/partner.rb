class Partner < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description, against: [ :title, :description ], using: {
    tsearch: { prefix: true }
  }
end
