json.array!(@banks) do |bank|
  json.extract! bank, :id, :name, :acc, :status
  json.url bank_url(bank, format: :json)
end
