class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :partner

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }
  validates :message, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
