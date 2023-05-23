class Actor < ApplicationRecord
  validates :name, presence: true, length: { maximum: 150 }

  validates :description, presence: true
  validates :image, presence: true

  has_many :movie_actors, dependent: :destroy
  has_many :movies, through: :movie_actors



  def to_s
    name
  end


end
