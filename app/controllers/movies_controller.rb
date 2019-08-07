class MoviesController < ApplicationController
 

  def index
    if params[:user_id]
       if !User.find_by_id params[:user_id]
          flash[:alert] = "User not found."
          redirect_to root_path
        else

          @movies = User.find(params[:user_id]).movies
          render template: 'users/user_movies' 
        end
    else
       @movies = Movie.all
    end

  end

  def new
    @movie = Movie.new
  end


 def create

    @movie = Movie.new(movie_params)
  
    if @movie.valid?
      @movie.save
      render json: @movie, status: 201
     
    else
      render :new
    end

  end


  def show
     @movie = Movie.find(params[:id])
     @commenter = User.find(session[:user_id])

         respond_to do |format|
            format.html { render :show }
            format.json { render json: @movie }
          end       
  
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
   
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
        @movie.save
        redirect_to @movie
    else
      render :edit
    end
  end 

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_url
  end


   def high_ratings
    @high_ratings = Movie.high_rating
   end 

  private

  def movie_params

    params.require(:movie).permit(:title, :description, :year, :user_id, :movie_img, :rating, genre_ids:[], genres_attributes: [:name])


  end

end
