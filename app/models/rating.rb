class Rating < ApplicationRecord
  validates :ip, presence: true, length: { maximum: 15 }
  validates :star, presence: true
  validates :movie, presence: true

  belongs_to :star, class_name: 'RatingStar'
  belongs_to :movie

  def to_s
    "#{star} - #{movie}"
  end
end
