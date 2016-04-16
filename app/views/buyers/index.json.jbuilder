json.array!(@buyers) do |buyer|
  json.extract! buyer, :id, :name
  json.url buyer_url(buyer, format: :json)
end
