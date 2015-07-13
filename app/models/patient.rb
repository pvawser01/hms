class Patient < ActiveRecord::Base
  belongs_to :bed
  belongs_to :patient_category
  
  validates_presence_of :first_name, :surname, :date_of_birth
  
end
