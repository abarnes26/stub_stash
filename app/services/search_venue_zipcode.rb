class SearchVenueZipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def venue_list
    JamBaseServices.new(zipcode).venue_lookup_zipcode
  end

  private
    attr_reader :zipcode

end
