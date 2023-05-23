class AddUrlToGenre < ActiveRecord::Migration[7.0]
  def change
    add_column :genres, :url, :string
    add_index :genres, :url, unique: true

  end
end
