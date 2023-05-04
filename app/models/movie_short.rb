class MovieShort < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :movie

  def to_s
    title
  end
end
