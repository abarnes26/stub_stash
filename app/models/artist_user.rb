class ArtistUser < ApplicationRecord
  validates_uniqueness_of :artist, scope: [:user_id]
  belongs_to :user
  belongs_to :artist

end
