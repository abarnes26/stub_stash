require 'rails_helper'

feature "User creates a new account" do
  it "sends the user to the dashboard when successful" do

    visit root_path

    click_on "Create New Account"

    expect(current_path).to eq(new_user_path)
    fill_in "user[username]", with: "Jonesin81"
    fill_in "user[password]", with: "password"
    click_on "Create Account"

    expect(page).to have_content("Congratulations! Your account has been created!")
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_no_content("Login")
  end
end
