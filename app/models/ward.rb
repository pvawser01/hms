class Ward < ActiveRecord::Base
  
  include HmsErrors
  
  belongs_to :hospital
  belongs_to :patient_category
  has_many :rooms
  
  validates_presence_of :name
  
  # Method to find the first available bed on a ward.
  # 
  #
  # Returns bed object on success or nil on failure
  def find_available_bed
    rooms.includes(:beds).where(:beds=>{ :patient_id => nil}).try(:first).try(:beds).try(:first)
  end  
  
  # Method to admit the patient to a ward and assigns bed.
  # 
  # PARAMETERS
  #   patient - the patient to be admitted.
  #
  # Returns true on successful admission, else raises HmsErrors::Ward::NoAvailableBeds
  def admit!(patient)
    raise HmsErrors::Ward::PatientCategoryMismatch unless self.patient_category == patient.patient_category
    
    bed = find_available_bed
    raise HmsErrors::Ward::NoAvailableBeds unless bed
    
    #Assign patient to bed.
    bed.patient = patient
    true
  end  
  
end
