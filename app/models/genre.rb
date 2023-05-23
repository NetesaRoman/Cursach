class Genre < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :url, presence: true, length: { maximum: 150 }

  has_many :movie_genres, dependent: :destroy
  has_many :movies, through: :movie_genres
  def to_s
    name
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name id description url]
  end
end
