class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :path, limit: 256
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
