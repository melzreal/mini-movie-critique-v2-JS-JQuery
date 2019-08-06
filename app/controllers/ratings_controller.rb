class RatingsController < ApplicationController

  def new
    @rating = Rating.new
    
  end

   def create
  
    @rating = Rating.new(rating_params)
    if @rating.valid?
      @rating.save
    else
     flash[:alert] = "Rating must be between 1 and 10."
    end

  end


  private

    def rating_params
        params.permit(:rating)
    end

end
