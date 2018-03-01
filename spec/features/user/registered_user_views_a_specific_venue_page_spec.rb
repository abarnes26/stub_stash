require 'rails_helper'

feature "A registered user visits the venue show page" do
  context "they have no shows for at this venue" do
    it "shows the user they have no shows" do
      user = create(:user)
      venue = create(:venue)
      UserVenue.create(venue: venue, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit venue_path(venue)

      expect(current_path).to eq(venue_path(venue))

      expect(page).to have_content("You haven't seen any shows here")
    end
  end

  context "they have seen one show at this venue" do
    it "shows that they have seen one show here and the artist name" do
      user = create(:user)
      artist = create(:artist)
      venue = create(:venue)
      UserVenue.create(venue: venue, user: user)
      create(:show, user: user, venue: venue, artist: artist)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit venue_path(venue)

      expect(page).to have_content("You've seen 1 show here!")
      expect(page).to have_content(Show.first.artist.name)
      expect(page).to have_content(Show.first.date.strftime("%m/%d/%Y"))
    end
  end

  context "they have seen multiple shows at this venue" do
    it "shows how many times they have been there and what artists they have seen" do
      user = create(:user)
      artist_1 = create(:artist)
      artist_2 = create(:artist)
      venue = create(:venue)
      create(:show, user: user, artist: artist_1, venue: venue)
      create(:show, user: user, artist: artist_2, venue: venue)
      create(:show, user: user, artist: artist_2, venue: venue)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit venue_path(venue)

      expect(page).to have_content("You've seen 3 shows here!")
      expect(page).to have_content("The artist you've seen the most here is #{artist_2.name}")

      expect(page).to have_content(Show.all[0].artist.name)
      expect(page).to have_content(Show.all[0].date.strftime("%m/%d/%Y"))
      expect(page).to have_content(Show.all[1].artist.name)
      expect(page).to have_content(Show.all[1].date.strftime("%m/%d/%Y"))
      expect(page).to have_content(Show.all[2].artist.name)
      expect(page).to have_content(Show.all[2].date.strftime("%m/%d/%Y"))
    end
  end
end
