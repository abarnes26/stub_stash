require 'rails_helper'

feature "A registered user visits the show page" do
  it "can add a new band from the show page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_shows_path
    click_on "Add A New Band"

    expect(current_path).to eq(new_band_path)

    fill_in "band[name]", with: "Band 1"

    click_on "Add Band!"

    expect(current_path).to eq(user_bands_path)

    expect(page).to have_content("Band 1")
  end

  it "can add a new venue from the show page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_shows_path
    click_on "Add A New Venue"

    expect(current_path).to eq(new_venue_path)

    fill_in "venue[name]", with: "Test Venue"
    fill_in "venue[city]", with: "Test City"
    select "Colorado", from: "venue[state]"

    click_on "Add Venue!"

    expect(current_path).to eq(user_shows_path)

    visit venues_path

    expect(page).to have_content("Test Venue")
  end

  it "can add a new show from the show page" do
    user = create(:user)
    band = create(:band)
    BandUser.create(user: user, band: band)
    venue = create(:venue)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_shows_path

    click_on "Add A New Show!"

    expect(current_path).to eq(new_user_show_path)

    select "#{band.name}", from: "show[band]"
    select "#{venue.name}", from: "show[venue]"
    fill_in "show[date]", with: "20/1/2017"

    click_on "Add Show!"

    expect(current_path).to eq(user_shows_path)

    expect(page).to have_content("Show Count: 1")
    expect(page).to have_content("A New show has been added to your stub stash!")
    expect(page).to have_content("Bands you've seen: #{band.name}")
    expect(page).to have_content("Venues you've been to: #{venue.name}")
  end

  it "can delete a show from the show index" do
    user = create(:user)
    band = create(:band)
    create(:band_user, user: user, band: band)
    show = create(:show, user: user, band: band)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_shows_path

    expect(page).to have_content("Show Count: 1")

    within ".show" do
      click_link "-"
    end

    # expect(flash[:alert]).to be_present
    #
    # within ".flash-message" do
    #   select "Yes"
    # end

    expect(current_path).to eq(user_shows_path)
    expect(page).to have_content("You don't have any stubs in your stash yet!")
  end
end
