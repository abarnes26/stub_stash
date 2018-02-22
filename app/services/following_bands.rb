class FollowingBands

  def initalize(user)
    @user = user
  end

  def following_list
    SpotifyServices.new(user).artists.map do |artist|
      
  end

  private

    attr_reader :user

end
