class Restaurant < ApplicationRecord
  CATEGORY = ['chinese', 'italian', 'japanese', 'french', 'belgian']
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: {in: CATEGORY}

  def sum_rating
    rating_array = []
    reviews.each do |review|
      rating_array << review.rating
    end
    average = rating_array.sum(0.0) / rating_array.size
    "#{average.round(1)}"
  end
end
