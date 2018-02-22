class Artist < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  has_many :shows
  has_many :artist_users
  has_many :users, through: :artist_users

end
