class AddIndexToAddress < ActiveRecord::Migration[5.0]
  def up
    rename_column :addresses, :latitude, :lat
    rename_column :addresses, :longitude, :lng
    add_earthdistance_index :addresses
  end

  def down
    remove_earthdistance_index :addresses
    rename_column :addresses, :lat, :latitude
    rename_column :addresses, :lng, :longitude
  end
end
