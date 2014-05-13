json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :rating, :tag_list, :comment, :latitude, :longitude
  json.url restaurant_url(restaurant, format: :json)
end
