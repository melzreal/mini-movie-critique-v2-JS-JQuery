class Movie < ApplicationRecord


	validates_uniqueness_of :title
	belongs_to :user
	
	has_many :comments


	has_many :movie_genres
	has_many :genres, through: :movie_genres
	accepts_nested_attributes_for :genres

	has_one_attached :movie_img


	def genres_attributes=(genres_attributes)
      genres_attributes.values.each do |genres_attributes|
        genre = Genre.find_or_create_by(genres_attributes)
        self.movie_genres.build(genre: genre)
      end
    end


	#  Method limited to this class.
    
    def self.violent
    	Movie.all.genres.collect{ |m| m.name.include?("PG13")}.include?(true) 
    end 

    # def self.high_rating
    #     Movie.all.collect{ |r| r.ratings.collect { |m| r if m.rating == 10}}.flatten.compact
    # end

    def next 
    	Movie.where("id > ?", id).first
 	end 

	
end
