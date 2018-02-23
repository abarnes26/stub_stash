class SearchVenueName

  def initialize(name)
    @name = name
  end

  def following_list
    JamBaseServices.new(name).venue_lookup_name
  end

  private

    attr_reader :name

end
