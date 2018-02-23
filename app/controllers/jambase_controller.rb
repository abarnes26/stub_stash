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

  def create_venue
    params = venue_params
    venue = Venue.new(
      jambase_id: params[:Id],
      name: params[:Name],
      address: params[:Address],
      city: params[:City],
      state: params[:State],
      country: params[:Country],
      zipcode: params[:ZipCode],
      url: params[:Url],
      latitude: params[:Latitude],
      longitude: params[:Longitude]
    )
    if venue.save
      flash[:success] = "A new venue has been added to your stash!"
      UserVenue.create(user: user, venue: venue)
      redirect_to venues_path
    else
      flash[:failure] = "Sorry, something went wrong when we were trying to add that venue, please try again."
      redirect_to new_venues_path
    end
  end

  private
    def name_params
      params.require(:name)[0]
    end

    def zipcode_params
      params.require(:zipcode)[0]
    end

    def venue_params
      params.require(:venue).permit(
        :Address,
        :City,
        :Country,
        :Id,
        :Latitude,
        :Longitude,
        :Name,
        :State,
        :Url,
        :ZipCode
      )
    end
end
