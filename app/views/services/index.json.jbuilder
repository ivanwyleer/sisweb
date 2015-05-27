json.array!(@services) do |service|
  json.extract! service, :id, :description, :price
  json.url service_url(service, format: :json)
end
