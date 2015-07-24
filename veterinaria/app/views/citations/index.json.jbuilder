json.array!(@citations) do |citation|
  json.extract! citation, :id, :date, :time, :observation
  json.url citation_url(citation, format: :json)
end
