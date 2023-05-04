class RatingStar < ApplicationRecord
  validates :value, presence: true, numericality: { only_integer: true }

  def to_s
    value.to_s
  end
end
