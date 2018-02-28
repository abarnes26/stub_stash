require 'rails_helper'

feature "A registered user visits the new venues page" do
  it "can add a new venue by name" do
    VCR.use_cassette("venue_search_by_name") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_venue_path
      expect(Venue.count).to eq(0)
      expect(UserVenue.count).to eq(0)

      within(".venue-search-name") do
        fill_in "name[]", with: "Red Rocks"
        click_button "Search"
      end

      expect(current_path).to eq(jambase_find_by_name_path)

      within first(".venue-container") do
        click_button "Select This Venue"
      end

      expect(current_path).to eq(venues_path)
      expect(Venue.count).to eq(1)
      expect(UserVenue.count).to eq(1)
    end
  end
end
