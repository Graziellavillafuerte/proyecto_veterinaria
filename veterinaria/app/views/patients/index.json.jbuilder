json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :color, :birthday, :sex, :weight, :client_id
  json.url patient_url(patient, format: :json)
end
