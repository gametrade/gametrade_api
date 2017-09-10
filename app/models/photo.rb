class Photo < ApplicationRecord
  belongs_to :game

  validates_presence_of :path
end
