class CommentSerializer < ActiveModel::Serializer
   attributes :id

   has_many :ratings
   belongs_to :user
   belongs_to :movie

end
