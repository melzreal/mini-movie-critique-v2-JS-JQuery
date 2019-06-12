class CommentsController < ApplicationController
  def index
  end
  
  def new
    @comment = Comment.new
  end


 def create
    @comment = Comment.create(comment_params)
    #@rating = Rating.new(params[:comment][:rating])

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
