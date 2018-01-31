require 'rails_helper'

feature "A registered user visits the show page" do
  it "can add a new band from the show page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit shows_path
    click_on "Add A New Band"

    expect(current_path).to eq(new_band_path)

    fill_in "band[name]", with: "Band 1"

    click_on "Add Band!"

    expect(current_path).to eq(shows_path)

    visit bands_path

    expect(page).to have_content("Band 1")
  end

  it "can add a new venue from the show page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit shows_path
    click_on "Add A New Venue"

    expect(current_path).to eq(new_venue_path)

    fill_in "venue[name]", with: "Test Venue"
    fill_in "venue[city]", with: "Test City"
    select "Colorado", from: "venue[state]"

    click_on "Add Venue!"

    expect(current_path).to eq(shows_path)

    visit venues_path

    expect(page).to have_content("Test Venue")
  end

  it "can add a new show from the show page" do
    user = create(:user)
    band = create(:band)
    venue = create(:venue)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit shows_path

    click_on "Add A New Show!"

    expect(current_path).to eq(new_show_path)

    select "#{band.name}", from: "show[band]"
    select "#{venue.name}", from:"show[venue]"
    page.execute_script("$('#show_date').val('20/2/2017')")

    click_on "Add Show!"

    expect(current_path).to eq(shows_path)

    expect(page).to have_content("Shows: 1")
    expect(page).to have_content("New show has been added!")
    expect(page).to have_content("Bands you've seen: #{band.name}")
    expect(page).to have_content("Venues you've been to: #{venue.name}")
  end
end
