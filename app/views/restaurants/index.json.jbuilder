json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :rating
  json.url restaurant_url(restaurant, format: :json)
end
