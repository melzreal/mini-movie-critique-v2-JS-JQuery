class Rating < ApplicationRecord
validates_inclusion_of :rating, {:in => 1..10,
  :message => "Rating must be between 1 and 10." }
  
	belongs_to :comment
	belongs_to :movie
end
