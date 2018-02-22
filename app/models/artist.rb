class Artist < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
  has_many :shows
  has_many :artist_users, dependent: :destroy
  has_many :users, through: :artist_users

end
