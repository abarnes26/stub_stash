class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = "Nice! Your new band has been added!"
      redirect_to shows_path
    else
      flash[:notice] = "Band was not created"
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      render_404
    end
  end

  private
    def band_params
      params.require(:band).permit(:name)
    end


end
