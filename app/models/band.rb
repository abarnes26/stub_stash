class Band < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  has_many :shows

end
