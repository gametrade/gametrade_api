class Address < ApplicationRecord
  act_as_geolocated

  validates_presence_of :kind, :street, :number, :zip_code, :street, :state,
                        :country

  belongs_to :user, optional: true
end
