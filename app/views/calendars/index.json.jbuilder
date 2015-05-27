json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :hair_size, :hair_color, :date_request, :date_marked, :date_send, :observation, :status, :sservice_id, :professional_id, :user_id
  json.url calendar_url(calendar, format: :json)
end
