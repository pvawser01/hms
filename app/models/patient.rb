class Patient < ActiveRecord::Base
  
  belongs_to :patient_category
  has_one :bed
  
  validates_presence_of :first_name, :surname, :date_of_birth
  
  # Method to admit the patient to a ward and assigns bed.
  # 
  # PARAMETERS
  #   ward - the ward to admit patient to.
  #
  # Returns bed object on success or error on failure
  # def admit!(ward)
  #     # Find available bed on the ward
  #     bed = ward.
  #   end  
  
end
