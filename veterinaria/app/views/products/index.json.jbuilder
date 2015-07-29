json.array!(@products) do |product|
  json.extract! product, :id, :name, :cost_price, :sale_price, :long_description{250}, :observation, :product_category_id, :unit_measure_id
  json.url product_url(product, format: :json)
end
