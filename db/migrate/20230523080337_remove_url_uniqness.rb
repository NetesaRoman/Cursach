class RemoveUrlUniqness < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :url, :string


    remove_index :movies, :url if index_exists?(:movies, :url)
    remove_index :genres, :url if index_exists?(:genres, :url)

  end
end
