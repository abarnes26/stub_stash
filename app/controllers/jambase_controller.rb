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
    venue = Venue.find_or_create_by(jambase_id: params[:Id]) do |venue|
      venue.jambase_id = params[:Id],
      venue.name = params[:Name],
      venue.address = params[:Address],
      venue.city = params[:City],
      venue.state = params[:State],
      venue.country = params[:Country],
      venue.zipcode = params[:ZipCode],
      venue.url = params[:Url],
      venue.latitude = params[:Latitude],
      venue.longitude = params[:Longitude]
    end
    if venue.save
      flash[:success] = "A new venue has been added to your stash!"
      UserVenue.create(user: current_user, venue: venue)
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
