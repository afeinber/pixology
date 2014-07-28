class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image, notice: 'Your image was successfully added to the collection.'
     else
       render action: 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:sharedimg, :caption, categories_attributes: [:id, :description, :_destroy])
  end
end
