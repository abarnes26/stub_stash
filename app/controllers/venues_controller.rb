class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      flash[:notice] = "A New Venue has been created!"
      redirect_to user_shows_path
    else
      flash[:notice] = "Venue was not created"
      render :new
    end
  end

  private
    def venue_params
      params.require(:venue).permit(:name, :city, :state)
    end


end
