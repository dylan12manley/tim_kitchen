class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  before_save(:titleize_name)

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  validates_numericality_of :cost, greater_than: 0

  scope :most_reviews, -> {(
    select("products.id, products.name, count(review.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

  scope :most_recent, -> { order(created_at: :desc).limit(3)}

  scope :local_products, -> { where(country_of_origin: "USA") }

  private
    def titleize_name
      self.name = self.name.titleize
    end
end
