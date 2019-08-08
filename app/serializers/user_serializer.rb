class UserSerializer < ActiveModel::Serializer
   attributes :id
	
	has_many :movies
	has_many :comments
end
