class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_picture, only: [:show, :edit, :update, :destroy]


  def index
    @picture = Picture.all.order('created_at DESC')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def destroy
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :description)
  end

  def find_picture
    @picture = Picture.find(params[:id])
  end
end
