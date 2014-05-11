class AddCommentToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :comment, :text
  end
end
