json.array!(@products) do |product|
  json.extract! product, :id, :name, :cost_price, :cost_price, :sale_price, :sale_price, :long_description, :observation, :product_category_id
  json.url product_url(product, format: :json)
end
