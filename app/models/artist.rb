class Artist < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
  has_many :shows, dependent: :destroy
  has_many :artist_users, dependent: :destroy
  has_many :users, through: :artist_users

  def self.most_seen_at_venue(user, venue)
    joins(shows: [:venue]).where(shows: {user: user}).where(shows: {venue: venue}).group(:id).first
  end

end
