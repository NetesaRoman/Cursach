class AddFieldsToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :name, :string
    add_column :categories, :description, :text
    add_column :categories, :url, :string
    add_index :categories, :url, unique: true

    add_column :actors, :name, :string
    add_column :actors, :age, :integer, default: 0
    add_column :actors, :description, :text
    add_column :actors, :image, :string
    add_index :actors, :name, unique: true

    add_column :genres, :name, :string
    add_column :genres, :description, :text
    add_column :genres, :url, :string
    add_index :genres, :url, unique: true

    add_column :movies, :title, :string
    add_column :movies, :tagline, :string, default: ''
    add_column :movies, :description, :text
    add_column :movies, :poster, :string
    add_column :movies, :year, :integer, default: 2019
    add_column :movies, :country, :string
    add_column :movies, :world_premier, :date
    add_column :movies, :budget, :integer, default: 0
    add_column :movies, :fees_in_usa, :integer, default: 0
    add_column :movies, :fees_in_world, :integer, default: 0
    add_column :movies, :category_id, :integer
    add_column :movies, :url, :string
    add_column :movies, :draft, :boolean, default: false
     add_foreign_key :movies, :categories

    add_column :movie_shorts, :title, :string
    add_column :movie_shorts, :description, :text
    add_column :movie_shorts, :image, :string
    add_column :movie_shorts, :movie_id, :integer
    add_foreign_key :movie_shorts, :movies


    add_column :reviews, :email, :string
    add_column :reviews, :name, :string
    add_column :reviews, :text, :text
    add_column :reviews, :parent_id, :integer
    add_column :reviews, :movie_id, :integer
    add_foreign_key :reviews, :reviews, column: :parent_id
    add_foreign_key :reviews, :movies, column: :movie_id

  end
end
