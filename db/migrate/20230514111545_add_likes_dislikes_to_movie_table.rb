class AddLikesDislikesToMovieTable < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :likes, :integer, default: 0
    add_column :movies, :dislikes, :integer, default: 0
  end
end
