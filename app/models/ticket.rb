class Ticket < ApplicationRecord
  belongs_to :event
  accepts_nested_attributes_for :event

  def self.get_from_event(event)
    where(event_id: event.id).order('value ASC')
  end
end
