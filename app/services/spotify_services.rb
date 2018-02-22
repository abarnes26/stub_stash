class SpotifyServices

  def initialize(user)
    @user = user
  end

  def user_artists
    get_json("me/following?type=artist&limit=50")[:artists][:items]
  end

  private

    def conn
      Faraday.new(url: "https://api.spotify.com/v1") do |faraday|
        faraday.headers["Authorization"] = "Bearer #{@user.spotify_token}"
        faraday.adapter  Faraday.default_adapter
      end
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

  end
