class RemixesController < ApplicationController
  before_action :authenticate_user!

  def new
    @remix = Image.new
    @parent = Image.find(params[:image_id])
  end

  def create
    @remix = current_user.images.new(remix_params)
    @image = Image.find(params[:image_id])

    if @remix.save

      @image.user.notify(
        "was remixed",
        "was remixed",
        @favorite
      )
     redirect_to @remix
    else
      flash.now[:alert] = @remix.errors.full_messages.join(', ')
      render action: 'new'
    end
  end

  private

  def remix_params
    binding.pry
    params.require(:image).permit(:sharedimg, :caption, categories_attributes: [:remix_id, :description, :_destroy])
  end

end
