class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.decimal :weight
      t.decimal :height
      t.string :mrn

      t.timestamps
    end

    add_index :patients, [:first_name, :last_name]
  end
end
