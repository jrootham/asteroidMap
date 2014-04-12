class CreateAsteroids < ActiveRecord::Migration
  def change
    create_table :asteroids do |t|
      t.string :ref_num
      t.string :name

      t.timestamps
    end
  end
end
