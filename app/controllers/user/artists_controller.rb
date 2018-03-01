class User::ArtistsController < ApplicationController

  def index
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to user_artists_path
  end

  def show
    unless current_user
      render_404
    end
  end

end
