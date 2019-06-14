class GenresController < ApplicationController

  def index
  	 @genres = Genre.all
  end 

  def new
    @genre = Genre.new
  end


  def create
    @genre = Genre.new(genre_params)
  end 

   def show
      @genre = Genre.find(params[:id])
   end
   
  private

    def genre_params
        params.require(:genre).permit(:name)
    end


end
