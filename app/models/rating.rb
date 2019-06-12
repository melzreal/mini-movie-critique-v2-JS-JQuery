class Rating < ApplicationRecord
	belongs_to :comment
	belongs_to :movie
end
