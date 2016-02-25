json.array!(@applications) do |application|
  json.extract! application, :id, :name, :image
  json.url application_url(application, format: :json)
end
