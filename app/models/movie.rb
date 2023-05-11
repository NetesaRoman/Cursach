class Movie < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :tagline, length: { maximum: 100 }
  validates :description, presence: true
  validates :poster, presence: true
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :country, presence: true
  validates :world_premier, presence: true
  validates :budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :fees_in_usa, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :fees_in_world, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :url, presence: true, length: { maximum: 150 }, uniqueness: true

  belongs_to :category


  has_and_belongs_to_many :directors, class_name: 'Actor'

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :movie_directors
  has_many :actors, through: :movie_directors

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  def to_s
    title
  end


  def get_review
    reviews.where(parent_id: nil)
  end
end
