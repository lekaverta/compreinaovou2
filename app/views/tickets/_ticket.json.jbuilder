json.extract! ticket, :id, :description, :quantity, :value, :email, :active, :profiles, :event_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
