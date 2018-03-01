class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :shows
  has_many :artist_users, dependent: :destroy
  has_many :user_venues, dependent: :destroy
  has_many :venues, through: :user_venues
  has_many :artists, through: :artist_users
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  enum role: ["user", "admin"]

  def visited_venues(user)
    venue_list(user).map { |venue| [venue.name, venue.latitude, venue.longitude] }
  end

  def venue_list(user)
    user.shows.map { |show| show.venue }
  end

end
