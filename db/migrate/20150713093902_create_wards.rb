class CreateWards < ActiveRecord::Migration
  def change
    create_table :wards do |t|
      t.references :hospital
      t.references :patient_category
      t.string :name
      t.timestamps null: false
    end
    
    add_index :wards, [:hospital_id, :name]
    add_index :wards, [:patient_category_id, :name]
  end
end
