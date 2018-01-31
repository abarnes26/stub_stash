class Venue < ApplicationRecord
  validates_presence_of :name, :city, :state

  has_many :shows

end
