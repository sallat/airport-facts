class CreateAirfields < ActiveRecord::Migration
  def change
    create_table :airfields do |t|
      t.string :city
      t.string :name
      t.float :zone
      t.string :country
      t.integer :altitude
      t.string :iaco
      t.float :longitude
      t.integer :airport_id
      t.float :latitude
      t.string :iata_faa
      t.string :dst

      t.timestamps
    end
  end
end
