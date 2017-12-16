class AddPriceToGame < ActiveRecord::Migration[5.0]
  def up
    add_column :games, :price, :float
  end

  def down
    remove_column :games, :price
  end
end
