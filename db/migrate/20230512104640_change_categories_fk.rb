class ChangeCategoriesFk < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :movies, :categories
  end
end
