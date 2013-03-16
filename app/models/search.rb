class Search < ActiveRecord::Base
  attr_accessible :name, :city, :altitude, :iata, :country, :airfield_id
  attr_accessor :airfield
  
  def airfields
    @airfields ||= find_airfields
 end
  
private

  def find_airfields
    airfields = Airfield.order(:name)
   
    airfields = airfields.where("lower(name) like ?", "%#{name.downcase}%") if name.downcase.present?
    airfields = airfields.where("lower(city) like ?", "%#{city.downcase}%") if city.downcase.present?
    airfields = airfields.where("lower(country) like ?", "%#{country.downcase}%") if country.downcase.present?
    airfields = airfields.where("(iata_faa) like ?", "%#{iata.upcase}%") if iata.upcase.present?
    airfields = airfields.where("altitude >= ?", altitude) if altitude.present?
    airfields
  end
end
