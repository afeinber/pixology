class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
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

  private

  def image_params
    params.require(:image).permit(:sharedimg, :caption, categorized_images_attributes: [:id])
  end
end
