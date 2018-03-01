require 'rails_helper'

describe SearchVenueName do
  it "instantiates" do
    search = SearchVenueName.new("VenueName")
    expect(search).to be_a(SearchVenueName)
  end

  it "can clean a name with more than two words" do
    clean = SearchVenueName.new("Venue Name")

    expect(clean.clean_name).to eq("Venue+Name")
  end

end
