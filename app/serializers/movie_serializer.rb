class MovieSerializer < ActiveModel::Serializer
   attributes :id, :title, :description, :year, :user_id, :movie_img

	belongs_to :user
	has_many :comments
	
end
