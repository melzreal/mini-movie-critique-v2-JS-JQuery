class Movie < ApplicationRecord
	validates_uniqueness_of :title
	has_many :users, through: :user_movies
	has_many :comments
	
end
