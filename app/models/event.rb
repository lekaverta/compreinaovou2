class Event < ApplicationRecord
  has_many :tickets
  validates :name, :date, :city, :state, :country, :image, presence: true

  def self.next
    where('date >= ?', Time.zone.now)
  end
end
