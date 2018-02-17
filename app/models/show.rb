class Show < ApplicationRecord
  validates_presence_of :date
  belongs_to :user
  belongs_to :band
  belongs_to :venue

end
