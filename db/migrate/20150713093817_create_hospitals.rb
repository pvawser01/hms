class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.timestamps null: false
    end
    
    add_index :hospitals, :name
  end
end
