class Product < ApplicationRecord
  has_many :reviews
  validates :name,:cost,:country, presence: true
  scope :made_in_usa, -> {where(country: 'The United States').limit(15)}
  before_save :capitalize
  scope :most_reviewed, -> {where(id: Product.review_most_product_ids.keys[0])}
  def self.most_recent_three
    Product.last(3)
  end
  def capitalize
    self.name = self.name.titleize()
  end
  def self.review_most_product_ids
    Review.group(:product_id).order('count_id DESC').limit(1).count(:id)
  end
end
