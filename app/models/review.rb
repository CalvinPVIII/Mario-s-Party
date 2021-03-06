class Review < ApplicationRecord
  belongs_to :product
  validates :author, :rating, :content, presence: true
  validates_length_of :content, minimum: 50, maximum: 250
  validates_inclusion_of :rating, :in => 1..5
end
