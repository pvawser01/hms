class CreatePatientCategories < ActiveRecord::Migration
  def change
    create_table :patient_categories do |t|
      t.references :hospital
      t.string :name
      t.timestamps null: false
    end
  
    add_index :patient_categories, [:hospital_id, :name]
  end
end
