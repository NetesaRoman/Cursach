class CreateMovieShorts < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_shorts do |t|

      t.timestamps
    end
  end
end
