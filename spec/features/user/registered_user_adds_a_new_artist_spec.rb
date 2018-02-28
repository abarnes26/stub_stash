require "rails_helper"

feature "User adds new artist" do
  it "can add a new artist from the show page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_show_path
    click_on "Add an Artist"

    expect(current_path).to eq(new_artist_path)

    fill_in "artist[name]", with: "Artist 1"

    click_on "Add Artist!"

    expect(current_path).to eq(user_artists_path)

    expect(page).to have_content("Artist 1")
  end

  it "can add a new artist from the artist index page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_artists_path

    click_on "Add an Artist"

    expect(current_path).to eq(new_artist_path)

    fill_in "artist[name]", with: "Artist 1"

    click_on "Add Artist!"

    expect(current_path).to eq(user_artists_path)

    expect(page).to have_content("Artist 1")
  end
end
