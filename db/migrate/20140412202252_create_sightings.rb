class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.datetime :date_sighted
      t.decimal :ra
      t.decimal :dec
      t.string :magn
      t.string :location
      t.references :asteroid, index: true

      t.timestamps
    end
  end
end
