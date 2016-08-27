class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_picture

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @picture.comments << @comment
    redirect_to @picture
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_picture
    @picture = Picture.find(params[:picture_id])
  end
end
