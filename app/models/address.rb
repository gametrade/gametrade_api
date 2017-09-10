class Address < ApplicationRecord
  validates_presence_of :kind, :street, :number, :zip_code, :street, :state,
                        :country

  belongs_to :user
end
