class BandsController < ApplicationController
# [:index, :create, :new, :edit, :show, :update, :destroy]

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to new_band(@band)
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])
    unless @band.nil?
      @band.update(band_params)
      redirect_to
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
