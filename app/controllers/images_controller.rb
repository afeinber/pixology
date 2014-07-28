class ImagesController < ApplicationController
   def show
    @image = Image.find(params[:id])
    @comment = Comment.new
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
