class Band < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  has_many :shows
  has_many :band_users
  has_many :users, through: :band_users

end
