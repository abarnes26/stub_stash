class Venue < ApplicationRecord
  validates_presence_of :name, :city, :state
  has_many :shows, dependent: :destroy
  has_many :user_venues, dependent: :destroy
  has_many :users, through: :shows

  def self.most_visited_venue_by_artist(user, artist)
    joins(shows: [:artist])
    .where(shows: {user: user})
    .where(shows: {artist: artist})
    .group(:id)
    .order("count(venue_id) DESC")
    .first
  end

end
