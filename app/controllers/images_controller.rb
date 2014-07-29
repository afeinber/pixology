class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @images = Image.order(created_at: :desc)
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(commentable: @image)
  end

  def new
    @image = Image.new
    20.times { @image.categories.build }
  end
  
  def create
    @image = Image.new(image_params)
  
    if @image.save
      redirect_to @image, notice: 'Your image was successfully added to the collection.'
     else
      flash.now[:alert] = "You must select an image before continuing."
      render action: 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    head :no_content
  end

  private

  def image_params
    params.require(:image).permit(:sharedimg, :caption, categorized_images_attributes: [:id])
  end
end
