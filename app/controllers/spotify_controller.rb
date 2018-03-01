class SpotifyController < ApplicationController

  def update
    current_user.spotify_token = auth_hash["credentials"]["token"]
    current_user.save!
    flash[:success] = "Nice! Your Spotify has been linked to your Stub Stash!"
    redirect_to user_artists_path
  end

  def import
    @user = current_user
    FollowingArtists.new(@user).following_list
    flash[:success] = "Artists successfully imported from Spotify!"
    redirect_to user_artists_path
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end

end
