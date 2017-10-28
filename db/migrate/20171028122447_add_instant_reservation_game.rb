class AddInstantReservationGame < ActiveRecord::Migration[5.0]
  def up
    add_column :games, :permitted_intant_reservation, :boolean
  end

  def down
    remove_column :games, :permitted_intant_reservation
  end
end
