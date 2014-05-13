class AddLatLngToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :latitude, :decimal, :precision => 15, :scale => 12
    add_column :restaurants, :longitude, :decimal, :precision => 15, :scale => 12
  end
end
