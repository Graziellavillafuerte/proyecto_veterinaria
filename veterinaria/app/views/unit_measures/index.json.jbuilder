json.array!(@unit_measures) do |unit_measure|
  json.extract! unit_measure, :id, :short_name, :name, :description
  json.url unit_measure_url(unit_measure, format: :json)
end
