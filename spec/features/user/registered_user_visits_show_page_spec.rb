require 'rails_helper'

feature "A registered user visits the show page" do
  it "can add a new show from the show page" do
    user = create(:user)
    artist = create(:artist)
    venue = create(:venue)
    ArtistUser.create(user: user, artist: artist)
    UserVenue.create(user: user, venue: venue)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_shows_path

    click_on "Add A New Show!"

    expect(current_path).to eq(new_user_show_path)

    select "#{artist.name}", from: "show[artist]"
    select "#{venue.name}", from: "show[venue]"
    fill_in "show[date]", with: "20/1/2017"


    click_on "Add Show!"

    expect(current_path).to eq(user_shows_path)

    expect(page).to have_content("Show Count: 1")
    expect(page).to have_content("A New show has been added to your stub stash!")
    within(".show") do
      expect(page).to have_content("Date: 01/20/2017")
      expect(page).to have_content("Artist: #{artist.name}")
      expect(page).to have_content("Venue: #{venue.name}")
    end

  end

  it "can delete a show from the show index" do
    user = create(:user)
    artist = create(:artist)
    create(:artist_user, user: user, artist: artist)
    show = create(:show, user: user, artist: artist)
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
