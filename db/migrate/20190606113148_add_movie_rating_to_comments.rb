class AddMovieRatingToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :rating, :integer, inclusion: 0..10

  end
end
