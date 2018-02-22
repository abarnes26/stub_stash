class SpotifyController < ApplicationController

  def update
    current_user.spotify_token = auth_hash["credentials"]["token"]
    current_user.save!
    flash[:success] = "Your Spotify has been successfully linked to your Stub Stash!"
    redirect_to user_bands_path
  end

  def import
    FollowingArtists.new(current_user).following_list
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end

end
