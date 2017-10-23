class CreateEncounters < ActiveRecord::Migration[5.1]
  def change
    create_table :encounters do |t|
      t.string :visit_number
      t.datetime :admitted_at
      t.datetime :discharged_at
      t.string :location
      t.string :room
      t.string :bed

      t.timestamps
    end
    add_reference :encounters, :patient, index:true
  end

  def down
    drop_table :encounters
  end
end
