class RatingSerializer < ActiveModel::Serializer
   attributes :id
	
   belongs_to :comment
   belongs_to :movie
end
