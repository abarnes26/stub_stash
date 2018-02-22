class SpotifyController < ApplicationController

  def update
    current_user.spotify_token = auth_hash["credentials"]["token"]
    current_user.update
    redirect_to user_bands_path
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end

end
