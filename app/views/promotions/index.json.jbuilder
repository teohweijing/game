json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :description, :application_id
  json.url promotion_url(promotion, format: :json)
end
