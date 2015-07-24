json.array!(@races) do |race|
  json.extract! race, :id, :name, :description, :category_id
  json.url race_url(race, format: :json)
end
