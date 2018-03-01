require 'rails_helper'

feature "A registered user visits the artist index page" do
  it "can delete an existing artist" do
    user = create(:user)
    artist = create(:artist)
    venue = create(:venue)
    artist_user = ArtistUser.create(user: user, artist: artist)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_artists_path

    expect(ArtistUser.count).to eq(1)

    within(".artist") do
      click_link "Remove"
    end

    expect(current_path).to eq(user_artists_path)

    expect(ArtistUser.count).to eq(0)
    expect(page).to have_no_content(".artist")
  end
end
