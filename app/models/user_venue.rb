class UserVenue < ApplicationRecord
  validates_uniqueness_of :venue, scope: [:user_id]
  belongs_to :user
  belongs_to :venue

end
