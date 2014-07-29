class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @images = Image.order(created_at: :desc)
  end
  def show
    @image = Image.find(params[:id])
  end
  def new
    @image = Image.new
  end
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image, notice: 'Image was successfully added.'
     else
       render action: 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:sharedimg, :caption)
  end
end
