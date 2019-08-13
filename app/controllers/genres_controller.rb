class GenresController < ApplicationController

  def index
  	 @genres = Genre.all
     respond_to do |format|
            format.html 
            format.json { render json: @genres }
          end 
  end 

  def new
    @genre = Genre.new
  end


  def create
    @genre = Genre.create(genre_params)
  end 

   def show
      @genre = Genre.find(params[:id])

       respond_to do |format|
            format.html 
            format.json { render json: @genre }
          end 
   end
   
  private

    def genre_params
        params.require(:genre).permit(:name)
    end


end
