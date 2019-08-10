class RatingSerializer < ActiveModel::Serializer
   attributes :id, :rating
	
   belongs_to :comment
   belongs_to :movie
end
