class Movie < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :tagline, length: { maximum: 100 }
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :country, presence: true
  validates :world_premier, presence: true
  validates :budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :fees_in_usa, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :fees_in_world, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  belongs_to :category


  has_many :movie_shorts,dependent: :destroy  # Добавляем ассоциацию с MovieShort

  has_many :movie_actors,dependent: :destroy
  has_many :actors, through: :movie_actors

  has_many :movie_directors,dependent: :destroy
  has_many :directors, through: :movie_directors

  has_many :movie_genres,dependent: :destroy
  has_many :genres, through: :movie_genres

  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy

  has_many :reviews, dependent: :destroy

  def to_s
    title
  end



  def get_review
    reviews.where(parent_id: nil)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[title genres_id_eq_any movie_genres genres genre_ids category_id_eq_any year_eq_any year category category_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[genres category movie_genres]
  end


end
