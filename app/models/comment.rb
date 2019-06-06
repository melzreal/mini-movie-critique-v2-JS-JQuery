class Comment < ApplicationRecord
  validates_uniqueness_of :text, scope: :user_id
  

	belongs_to :user, class_name: 'User', foreign_key: 'user_id'
	belongs_to :movie, class_name: 'Movie', foreign_key: 'movie_id'
end
