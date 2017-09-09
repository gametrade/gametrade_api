class CreateGameKinds < ActiveRecord::Migration[5.0]
  def change
    create_table :game_kinds do |t|
      t.string :name, limit: 30

      t.timestamps
    end
  end
end
