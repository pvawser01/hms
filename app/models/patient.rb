class Patient < ActiveRecord::Base
  
  include HmsErrors
  
  belongs_to :patient_category
  has_one :bed
  
  validates_presence_of :first_name, :surname, :date_of_birth
  
  # Method to admit the patient to a ward and assigns bed.
  # 
  # PARAMETERS
  #   ward - the ward to admit patient to.
  #
  # Returns true on successful admission, else raises HmsErrors::Ward::NoAvailableBeds
  def admit!(ward)
    bed = ward.find_available_bed
    
    raise HmsErrors::Ward::NoAvailableBeds unless bed
    
    bed.patient = self
    true
  end  
  
end
