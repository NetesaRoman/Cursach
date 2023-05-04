class Review < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { maximum: 100 }
  validates :text, presence: true, length: { maximum: 5000 }

  belongs_to :parent, class_name: 'Review', optional: true
  belongs_to :movie

  def to_s
    "#{name} - #{movie}"
  end
end
