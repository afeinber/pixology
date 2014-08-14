class ImagesController < ApplicationController

  def default_serializer_options
    {root: false}
  end

  respond_to :html, :json

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @images = Image.order(created_at: :desc)
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(commentable: @image).includes(:user, :comments)
  end

  def new
    @image = Image.new
    @uploaded_image = Image.new
    @uploaded_image.categories.build
  end

  def create
    @image = current_user.images.new(image_params)

    if @image.save
      respond_with @image
    else
      render action: 'new'
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)

    if @image.save
      flash[:notice] = "Your image was sucessfully created"
      redirect_to(@image)
    else
      flash.now[:alert] = "Your image was not able to be saved"
      redirect_to :back
    end
  end

  def destroy
    @image = current_user.images.find(params[:id])
    @image.destroy

    head :no_content
  end

  private

  def image_params
    params.require(:image).permit(:sharedimg, :caption, categories_attributes: [:image_id, :description, :_destroy])
  end
end
