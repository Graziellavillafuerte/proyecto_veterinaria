json.array!(@services) do |service|
  json.extract! service, :id, :name, :price, :price, :observation, :citation_id
  json.url service_url(service, format: :json)
end
