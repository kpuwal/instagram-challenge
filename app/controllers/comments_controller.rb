class CommentsController < ApplicationController
  before_action :find_picture

  def new
    @comment = Comment.new
  end

  def create
    @picture.comments.create(comment_params)
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts, :rating)
  end

  def find_picture
    @picture = Picture.find(params[:picture_id])
  end

end
