class MovieGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre

  def self.ransackable_attributes(auth_object = nil)
    %w[genre_id movie_id]
  end

end
