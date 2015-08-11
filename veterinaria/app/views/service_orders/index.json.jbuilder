json.array!(@service_orders) do |service_order|
  json.extract! service_order, :id, :citation_id
  json.url service_order_url(service_order, format: :json)
end
