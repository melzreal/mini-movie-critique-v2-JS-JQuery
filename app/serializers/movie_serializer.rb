class MovieSerializer < ActiveModel::Serializer
   attributes :id, :title, :description, :year
end
