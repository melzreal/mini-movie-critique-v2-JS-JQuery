class Movie < ApplicationRecord
	validates_uniqueness_of :title
	belongs_to :user
	
	has_many :comments
	has_many :ratings, through: :comments

	has_many :movie_genres
	has_many :genres, through: :movie_genres
	

	has_one_attached :movie_img
	
end
