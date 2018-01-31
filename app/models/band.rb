class Band < ApplicationRecord
  validates_presence_and_uniqueness_of :name
  has_many :shows 

end
