class Airfield < ActiveRecord::Base
  attr_accessible :airport_id, :altitude, :city, :country, :dst, :iaco, :iata_faa, :latitude, :longitude, :name, :zone
  
  acts_as_gmappable :process_geocoding => false
  
  has_many :reviews
  #has_many :users, :through => reviews
end
