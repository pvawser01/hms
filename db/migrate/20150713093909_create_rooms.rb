class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :ward
      t.string :name
      t.timestamps null: false
    end
    
    add_index :rooms, [:ward_id, :name]
  end
end
