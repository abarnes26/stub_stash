class JambaseController < ApplicationController

  def index
  end

  def find_venue_by_name
    SearchVenueName.new(search_params).venue_list_name
  end

  def find_venue_by_zipcode
    SearchVenueZipcode.new(search_params).venue_list_name
  end

  private
    def search_params
      params.require(:params).permit(:zipcode, :name)
    end

end
