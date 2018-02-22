class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
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

  def show
    if current_user
      @user = current_user
    else
      render_404
    end
  end

  private
    def artist_params
      params.require(:artist).permit(:name)
    end


end
