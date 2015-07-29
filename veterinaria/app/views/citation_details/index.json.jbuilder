json.array!(@citation_details) do |citation_detail|
  json.extract! citation_detail, :id, :quantity, :amount, :citation_id, :client_id
  json.url citation_detail_url(citation_detail, format: :json)
end
