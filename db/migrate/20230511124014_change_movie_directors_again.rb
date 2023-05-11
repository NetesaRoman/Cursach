class ChangeMovieDirectorsAgain < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :movie_directors, :directors, column: :director_id
  end
end
