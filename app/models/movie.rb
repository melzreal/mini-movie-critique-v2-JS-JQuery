class Movie < ApplicationRecord
	validates_uniqueness_of :title
	belongs_to :user
	has_many :comments
	has_many :genres
	
	has_one_attached :movie_img
	
end
