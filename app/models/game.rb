class Game < ApplicationRecord
  validates_presence_of :name, :description, :players, on: :create

  enum status: %i[available pending reserved]

  belongs_to :user
  belongs_to :game_kind
  belongs_to :theme

  has_many :photos
  has_many :reservations

  accepts_nested_attributes_for :photos, allow_destroy: true

  before_save :set_status

  def set_status
    self.status ||= :available
  end
end
