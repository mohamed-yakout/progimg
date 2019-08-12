class TransferredImagesController < ApplicationController
  before_action :set_transferred_image, only: [:show, :update, :destroy]

  # GET /transferred_images
  def index
    @transferred_images = TransferredImage.all

    render json: @transferred_images
  end

  # GET /transferred_images/1
  def show
    render json: @transferred_image
  end

  # POST /transferred_images
  def create
    @transferred_image = TransferredImage.new(transferred_image_params)

    if @transferred_image.save
      render json: @transferred_image, status: :created, location: @transferred_image
    else
      render json: @transferred_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transferred_images/1
  def update
    if @transferred_image.update(transferred_image_params)
      render json: @transferred_image
    else
      render json: @transferred_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transferred_images/1
  def destroy
    @transferred_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transferred_image
      @transferred_image = TransferredImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transferred_image_params
      params.require(:transferred_image).permit(:img, :format, :resize, :rotate, :colorspace, :image_id)
    end
end
