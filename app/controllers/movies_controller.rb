class MoviesController < ApplicationController
 

  def index
    if session[:user_id]
      @movies = User.find(session[:user_id]).movies
      render template: 'users/user_movies' 
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
      redirect_to movie_path(@movie)
    else
      render :new
    end

  end


  def show

    @movie = Movie.find(params[:id])
    @commenter = User.find(session[:user_id])

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
    movie.find(params[:id]).destroy
    redirect_to movies_url
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :description, :year, :movie_img, :user_id)
  end

end
