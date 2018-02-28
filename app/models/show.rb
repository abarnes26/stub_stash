class Show < ApplicationRecord
  validates_presence_of :date
  belongs_to :user
  belongs_to :artist
  belongs_to :venue

  def self.show_list_for_venue(user, venue)
    where(user: user.id).where(venue: venue)
  end

end
