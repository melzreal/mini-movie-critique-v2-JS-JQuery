class User < ApplicationRecord

	validates_uniqueness_of :username
	has_many :movies
	has_many :comments


end
