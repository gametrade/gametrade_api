class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :kind, limit: 10
      t.string :street, limit: 50
      t.string :number, limit: 10
      t.string :complement, limit: 20
      t.string :zip_code, limit: 20
      t.string :neighborhood, limit: 20
      t.string :city, limit: 50
      t.string :state, limit: 30
      t.string :country, limit: 30
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
