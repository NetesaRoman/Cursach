class Actor < ApplicationRecord
  validates :name, presence: true, length: { maximum: 150 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :image, presence: true

  has_many :movie_actors, dependent: :destroy
  has_many :movies, through: :movie_actors



  def to_s
    name
  end


end
