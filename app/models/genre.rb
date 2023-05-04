class Genre < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :url, presence: true, length: { maximum: 150 }, uniqueness: true

  def to_s
    name
  end
end
