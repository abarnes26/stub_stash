class VenuesController < ApplicationController

  def index
    @venues = current_user.venues
  end

  def new
    @venue = Venue.new
  end

  def show
    @venue = Venue.find(params[:id])
    @show_list = Show.show_list_for_venue(current_user, @venue)
    @most_seen_artist = Artist.most_seen_at_venue(current_user, @venue)
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

  def destroy
    venue = Venue.find(params[:id])
    venue.destroy
    redirect_to venues_path
  end

  private
    def venue_params
      params.require(:venue).permit(:name, :city, :state)
    end


end
