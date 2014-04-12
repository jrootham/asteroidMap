class CreateGaleries < ActiveRecord::Migration
  def change
    create_table :galeries do |t|
      t.datetime :date_taken
      t.references :asteroid, index: true

      t.timestamps
    end
  end
end
