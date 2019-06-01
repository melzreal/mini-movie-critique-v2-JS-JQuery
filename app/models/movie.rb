class Movie < ApplicationRecord
	validates_uniqueness_of :title
	belongs_to :user
	has_many :comments
	
end
