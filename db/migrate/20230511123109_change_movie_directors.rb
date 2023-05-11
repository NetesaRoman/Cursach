class ChangeMovieDirectors < ActiveRecord::Migration[7.0]
  def change
    remove_reference :movie_directors, :actor, null: false, foreign_key: true
    add_reference :movie_directors, :director, null: false, foreign_key: true
  end
end
