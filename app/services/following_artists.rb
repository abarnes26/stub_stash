class FollowingArtists

  def initialize(user)
    @user = user
  end

  def following_list
    SpotifyServices.new(user).user_artists.map do |artist|
      new_artist = Artist.create!(name: artist[:name], url: artist[:external_urls][:spotify])
      ArtistUser.create!(artist: new_artist, user: user)
    end
  end

  private

    attr_reader :user

end
