class CommentsController < ApplicationController
  def index
  end
  
  def new
    @comment = Comment.new
  end


 def create

    @comment = Comment.new(comment_params)
    @rating = Rating.new(comment_id: @comment.id, movie_id: params[:comment][:movie_id], rating: params[:comment][:ratings])
  
    if !@rating.save
      flash[:alert] = "Rating must be between 1 and 10."
    else 
      @comment.ratings << @rating
      @comment.save    
    end
    
    redirect_to movie_path(@comment.movie_id)

  end


  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :movie_id, :text)

  end

end
