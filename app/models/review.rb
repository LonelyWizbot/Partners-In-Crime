class Review < ApplicationRecord
  belongs_to :partner, dependent: :destroy
  belongs_to :user
  validates :comment, presence: true, length: { minimum: 6 }
end
