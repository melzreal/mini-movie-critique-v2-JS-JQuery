class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rating, inclusion: 0..10
      t.integer :comment_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
