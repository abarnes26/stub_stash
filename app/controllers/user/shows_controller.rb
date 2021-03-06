class User::ShowsController < ApplicationController

  def index
    @venue_markers = current_user.reload.visited_venues(current_user)
  end

  def new
    @show = current_user.shows.new
    @venues = Venue.all
  end

  def create
    @show = Show.new(artist: artist_lookup, venue: venue_lookup, date: show_params[:date], user: current_user)
    if @show.save
      flash[:notice] = "A New show has been added to your stub stash!"
      redirect_to user_shows_path
    else
      flash[:notice] = "Sorry, something went wrong. Please try again"
      redirect_to new_user_show_path
    end
  end

  def destroy
    @show = Show.find(params[:id])
    @show.delete
    redirect_to user_shows_path
  end


  private
    def show_params
      params.require(:show).permit(:artist, :venue, :date)
    end

    def artist_lookup
      Artist.find_by(name: show_params[:artist])
    end

    def venue_lookup
      Venue.find_by(name: show_params[:venue])
    end

end
