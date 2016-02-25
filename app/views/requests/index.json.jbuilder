json.array!(@requests) do |request|
  json.extract! request, :id, :category, :game_name, :bank_name, :bank_acc, :amount, :user_id
  json.url request_url(request, format: :json)
end
