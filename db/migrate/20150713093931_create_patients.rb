class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :patient_category
      t.string :first_name
      t.string :surname
      t.datetime :date_of_birth
      t.timestamps null: false
    end
  
    add_index :patients, :patient_category_id
    add_index :patients, :date_of_birth
    add_index :patients, [:first_name, :surname]
    
  end
end
