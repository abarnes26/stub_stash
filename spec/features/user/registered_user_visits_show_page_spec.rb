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
end
