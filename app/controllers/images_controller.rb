class ImagesController < ApplicationController

  def default_serializer_options
    {root: false}
  end

  respond_to :html, :json

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(commentable: @image)
  end
  def new
    @image = Image.new
  end
  def create
    authenticate_user!
    @image = current_user.images.new(image_params)

    if @image.save

      #render :text => @image.sharedimg.url(:thumb)
      respond_with @image

    else
      render action: 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:sharedimg, :caption)
  end
end
