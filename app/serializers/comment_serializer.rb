class CommentSerializer < ActiveModel::Serializer
   attributes :id, :user_id, :movie_id, :text

   has_many :ratings
   belongs_to :user
   belongs_to :movie

end
