class RenamePermittedIntantReservation < ActiveRecord::Migration[5.0]
  def up
    rename_column :games, :permitted_intant_reservation, :permitted_instant_reservation
  end

  def down
    rename_column :games, :permitted_instant_reservation, :permitted_intant_reservation
  end
end
