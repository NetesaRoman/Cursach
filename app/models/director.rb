class Director < ApplicationRecord
  validates :name, presence: true, length: { maximum: 150 }

  validates :description, presence: true
  validates :image, presence: true

  has_many :movie_directors,dependent: :destroy
  has_many :movies, through: :movie_directors



  def to_s
    name
  end
end
