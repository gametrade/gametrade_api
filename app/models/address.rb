class Address < ApplicationRecord
  acts_as_geolocated

  validates_presence_of :kind, :street, :number, :zip_code, :street, :state,
                        :country

  after_validation :geocode
  belongs_to :user, optional: true

  geocoded_by :full_address do |obj,results|
    if geo = results.first
      obj.lat = geo.latitude
      obj.lng = geo.longitude
    end
  end

  def full_address
    "#{self.street}, #{self.neighborhood}, #{self.city} #{self.number}, #{self.country}"
  end
end
