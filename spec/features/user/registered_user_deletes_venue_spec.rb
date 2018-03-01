require 'rails_helper'

feature "A registered user visits the artist index page" do
  it "can delete an existing artist" do
    user = create(:user)
    venue = create(:venue)
    UserVenue.create(user: user, venue: venue)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit venues_path

    expect(UserVenue.count).to eq(1)

    within(".venue-listing-show") do
      click_link "Remove"
    end

    expect(current_path).to eq(venues_path)

    expect(UserVenue.count).to eq(0)
    expect(page).to have_no_content(".venue-listing-show")
  end
end
