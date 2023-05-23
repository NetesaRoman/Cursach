class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 150 }
  validates :description, presence: true
  validates :url, presence: true, length: { maximum: 150 }

  has_many :movies, dependent: :nullify

  def to_s
    name
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name id description url]
  end
end
