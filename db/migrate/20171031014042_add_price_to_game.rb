class AddPriceToGame < ActiveRecord::Migration[5.0]
  def up
    add_column :games, :price, :decimal, precision: 6, scale: 2
  end

  def down
    remove_column :games, :price
  end
end
