class Address < ApplicationRecord
  act_as_geolocated

  validates_presence_of :kind, :street, :number, :zip_code, :street, :state,
                        :country

  # Após a validação de dados chama o método para pegar a latitude e longitude
  after_validation :geocode
  belongs_to :user, optional: true

  # Chama a API do geocode e devolver os dados completos do endereço
  # Com os dados nós preenchemos a latitude e longitude
  geocoded_by :full_address do |obj,results|
    if geo = results.first
      obj.lat = geo.latitude
      obj.lng = geo.longitude
    end
  end

  # Monta uma String com o endereço completo
  def full_address
    "#{self.street}, #{self.neighborhood}, #{self.city} #{self.number}, #{self.country}"
  end
end
