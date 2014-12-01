class MapPoint < ActiveRecord::Base
  attr_accessible :latitude, :longitude
  belongs_to :user
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  after_validation :geocode
end
