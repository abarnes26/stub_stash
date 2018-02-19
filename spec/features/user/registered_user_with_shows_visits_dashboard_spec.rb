require 'rails_helper'

feature "A registered user with several shows visits their dashboard" do
  before(:each) do
    @user = create(:user)
    band = create(:band)
    venue = create(:venue)
    band_user = BandUser.create(user: @user, band: band)
    show_1 = Show.create(user: @user, band: band, venue: venue, date: ("21/3/2015").to_date)
    show_2 = Show.create(user: @user, band: band, venue: venue, date: ("25/3/2015").to_date)
    show_3 = Show.create(user: @user, band: band, venue: venue, date: ("30/3/2015").to_date)
  end

  xit "user sees show analytics" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
    expect(page).to have_content("Total Shows: 3")
    expect(page).to have_content("")
  end
end
