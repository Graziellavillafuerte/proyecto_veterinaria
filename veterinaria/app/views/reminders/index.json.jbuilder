json.array!(@reminders) do |reminder|
  json.extract! reminder, :id, :date, :name, :lastname, :secondlastname, :email, :state, :subject
  json.url reminder_url(reminder, format: :json)
end
