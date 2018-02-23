class Venue < ApplicationRecord
  validates_presence_of :name, :city, :state
  has_many :shows
  has_many :users, through: :shows

end
