class FollowingArtists

  def initialize(user)
    @user = user
  end

  def following_list
    SpotifyServices.new(user).user_artists.map do |artist|
      new_artist = Artist.find_or_create_by(name: artist[:name]) do |art|
         art.url = artist[:external_urls][:spotify]
       end
      ArtistUser.create(artist: new_artist, user: user)
    end
  end

  private

    attr_reader :user

end
