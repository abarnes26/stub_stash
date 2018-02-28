class SearchVenueName

  def initialize(name)
    @name = name
  end

  def venue_list
    binding.pry
    JamBaseServices.new(clean_name).venue_lookup_name
  end

  def clean_name
    unless name.split.size == 1
      name.gsub(/ /, '+')
    end
    name
  end

  private
    attr_reader :name

end
