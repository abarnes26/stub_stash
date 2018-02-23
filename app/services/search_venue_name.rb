class SearchVenueName

  def initialize(name)
    @name = name
  end

  def venue_list
    JamBaseServices.new(clean_name).venue_lookup_name
  end

  def clean_name
    name.gsub(/ /, '+')
  end

  private
    attr_reader :name

end
