class Show < ApplicationRecord
  validates_presence_of :date
  belongs_to :user
  belongs_to :artist
  belongs_to :venue

end
