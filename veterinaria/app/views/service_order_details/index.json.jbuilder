json.array!(@service_order_details) do |service_order_detail|
  json.extract! service_order_detail, :id, :quantity, :service_order_id, :product_id
  json.url service_order_detail_url(service_order_detail, format: :json)
end
