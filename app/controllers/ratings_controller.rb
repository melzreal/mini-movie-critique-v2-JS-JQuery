class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

   def create
  
    @rating = Rating.new(rating_params)
   

  end


  private

    def rating_params
        params.permit(:rating)
    end

end
