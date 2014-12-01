class AddAddressToMapPoints < ActiveRecord::Migration
  def change
  	add_column :map_points, :address, :string
  end
end
