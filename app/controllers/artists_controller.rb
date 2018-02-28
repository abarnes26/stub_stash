class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
    @show_list = Show.show_list_for_artist(current_user, @artist)
    @most_visited_venue = Venue.most_visited_venue_by_artist(current_user, @artist)
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      ArtistUser.create(user: current_user, artist: @artist)
      flash[:notice] = "Nice! Your new artist has been added!"
      redirect_to user_artists_path
    else
      flash[:notice] = "Artist was not created"
      render :new
    end
  end

  private
    def artist_params
      params.require(:artist).permit(:name)
    end


end
