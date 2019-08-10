class UserSerializer < ActiveModel::Serializer
   attributes :id, :name, :username, :password, :email, :image, :uid
	
	has_many :movies
	has_many :comments
end
