class CreateDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :directors do |t|

      t.string :name, limit: 150, null: false
      t.integer :age, null: false
      t.text :description, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
