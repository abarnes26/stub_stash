class ShowsController < ApplicationController

  def new
    @show = Show.new
    @venues = Venue.all
  end

  def create
    @show = Show.new(band: band_lookup, venue: venue_lookup, date: show_params[:date], user: current_user)
    if @show.save
      flash[:notice] = "A New show has been added to your stub stash!"
      redirect_to shows_path
    else
      flash[:notice] = "Sorry, something went wrong. Please try again"
      render :new
    end
  end

  def index

  end

  private
    def show_params
      params.require(:show).permit(:band, :venue, :date)
    end

    def band_lookup
      Band.find_by(name: show_params[:band])
    end

    def venue_lookup
      Venue.find_by(name: show_params[:venue])
    end

end
