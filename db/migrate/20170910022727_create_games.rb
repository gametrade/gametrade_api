class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, limit: 100
      t.string :description, limit: 300
      t.datetime :launch_date
      t.datetime :lifetime
      t.integer :players
      t.references :user, foreign_key: true
      t.references :game_kind, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
