class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string  :text
      t.integer :rating, inclusion: 0..10

      t.timestamps
    end
  end
end
