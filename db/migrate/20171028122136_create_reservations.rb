class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :status
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :value, precision: 6, scale: 2

      t.timestamps
    end
  end
end
