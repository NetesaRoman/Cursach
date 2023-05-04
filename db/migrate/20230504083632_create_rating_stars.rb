class CreateRatingStars < ActiveRecord::Migration[7.0]
  def change
    create_table :rating_stars do |t|

      t.timestamps
    end
  end
end
