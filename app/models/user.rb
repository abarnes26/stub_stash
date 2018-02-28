class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :artist_users, dependent: :destroy
  has_many :shows
  has_many :venues, through: :shows
  has_many :artists, through: :artist_users
  has_many :user_venues
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  enum role: ["user", "admin"]

  def show_list(user, venue)
    Show.where(user_id: user.id).where(venue: venue)
  end

end
