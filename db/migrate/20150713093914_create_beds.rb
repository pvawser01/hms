class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.references :room
      t.references :patient
      t.string :bed_number
      t.timestamps null: false
    end
    
    add_index :beds, [:room_id, :bed_number]
  end
end
