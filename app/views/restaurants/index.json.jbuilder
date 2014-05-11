json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :rating, :tag_list
  json.url restaurant_url(restaurant, format: :json)
end
