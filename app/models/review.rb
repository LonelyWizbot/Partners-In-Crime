class Review < ApplicationRecord
  belongs_to :partner
  belongs_to :user
  validates :comment, presence: true, length: { minimum: 6 }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
