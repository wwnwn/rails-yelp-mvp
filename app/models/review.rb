class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true
  validates :restaurant, presence: true
  validates :rating, numericality: { only_integer: true }
  validates_inclusion_of :rating, in: 0..5, message: 'The rating must be a number between 0 and 5.'
end
