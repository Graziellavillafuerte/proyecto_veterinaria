json.array!(@service_details) do |service_detail|
  json.extract! service_detail, :id, :quantity, :product_id, :service_id
  json.url service_detail_url(service_detail, format: :json)
end
