class ChangeCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|

      t.timestamps
    end

    add_column :categories, :name, :string
    add_column :categories, :description, :text
    add_column :categories, :url, :string
    add_index :categories, :url, unique: true


  end
end
