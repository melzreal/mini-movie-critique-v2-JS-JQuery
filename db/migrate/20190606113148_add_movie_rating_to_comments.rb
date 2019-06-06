class AddMovieRatingToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :movie_rating, :integer, inclusion: 0..10

  end
end
