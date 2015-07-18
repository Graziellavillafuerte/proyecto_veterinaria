json.array!(@clients) do |client|
  json.extract! client, :id, :name, :firstlastname, :secondlastname, :birthday, :direction, :phone, :email
  json.url client_url(client, format: :json)
end
