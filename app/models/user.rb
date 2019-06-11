class User < ApplicationRecord

	has_secure_password
	validates_uniqueness_of :username
	has_many :movies
	has_many :comments
end
