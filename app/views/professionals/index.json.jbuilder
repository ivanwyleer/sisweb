json.array!(@professionals) do |professional|
  json.extract! professional, :id, :name, :specialty
  json.url professional_url(professional, format: :json)
end
