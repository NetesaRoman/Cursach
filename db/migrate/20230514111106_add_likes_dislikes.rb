class AddLikesDislikes < ActiveRecord::Migration[7.0]
  def change

        create_table :likes do |t|
          t.references :user, null: false
          t.references :movie, null: false

          t.timestamps
        end

        add_index :likes, [:user_id, :movie_id], unique: true

        create_table :dislikes do |t|
          t.references :user, null: false
          t.references :movie, null: false

          t.timestamps
        end

        add_index :dislikes, [:user_id, :movie_id], unique: true
  end
end
