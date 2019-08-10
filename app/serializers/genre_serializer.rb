class GenreSerializer < ActiveModel::Serializer
   attributes :id, :name
   
   has_many :movie_genres
   has_many :movies, through: :movie_genres

end
