class JambaseController < ApplicationController

  def index
  end

  def find_venue_by_name
    @name = name_params
    @venues = SearchVenueName.new(@name).venue_list[:Venues]
  end

  def find_venue_by_zipcode
    @zipcode = zipcode_params
    @venues = SearchVenueZipcode.new(@zipcode).venue_list[:Venues]
  end

  private
    def name_params
      params.require(:name)[0]
    end

    def zipcode_params
      params.require(:zipcode)[0]
    end
end
