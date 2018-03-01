require 'rails_helper'

feature "A registered user visits the artist show page" do
  context "they have no shows for that artist" do
    it "shows the user they have no shows" do
      user = create(:user)
      artist = create(:artist)
      artist_user = ArtistUser.create(user: user, artist: artist)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit artist_path(artist)

      expect(current_path).to eq(artist_path(artist))

      expect(page).to have_content("You haven't added any shows for #{artist.name} yet!")
    end
  end

  context "they have seen one show that that artist" do
    it "shows that they have seen the artist one time and what venue" do
      user = create(:user)
      artist = create(:artist)
      venue = create(:venue)
      ArtistUser.create(user: user, artist: artist)
      create(:show, user: user, artist: artist, venue: venue)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit artist_path(artist)

      expect(page).to have_content("You've seen #{artist.name} 1 time!")
      expect(page).to have_content("You've seen this artist most at #{venue.name}")
      expect(page).to have_content(Show.first.artist.name)
      expect(page).to have_content(Show.first.venue.name)
      expect(page).to have_content(Show.first.date.strftime("%m/%d/%Y"))
    end
  end

  context "they have seen one show that that artist" do
    it "shows that they have seen the artist one time and what venue" do
      user = create(:user)
      artist = create(:artist)
      venue_1 = create(:venue)
      venue_2 = create(:venue)
      ArtistUser.create(user: user, artist: artist)
      create(:show, user: user, artist: artist, venue: venue_1)
      create(:show, user: user, artist: artist, venue: venue_2)
      create(:show, user: user, artist: artist, venue: venue_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit artist_path(artist)

      expect(page).to have_content("You've seen #{artist.name} 3 times!")
      expect(page).to have_content("You've seen this artist most at #{venue_2.name}")

      expect(page).to have_content(Show.all[0].artist.name)
      expect(page).to have_content(Show.all[0].venue.name)
      expect(page).to have_content(Show.all[0].date.strftime("%m/%d/%Y"))
      expect(page).to have_content(Show.all[1].artist.name)
      expect(page).to have_content(Show.all[1].venue.name)
      expect(page).to have_content(Show.all[1].date.strftime("%m/%d/%Y"))
      expect(page).to have_content(Show.all[2].artist.name)
      expect(page).to have_content(Show.all[2].venue.name)
      expect(page).to have_content(Show.all[2].date.strftime("%m/%d/%Y"))
    end
  end
end
