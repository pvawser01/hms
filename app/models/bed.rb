class Bed < ActiveRecord::Base
  
  include HmsErrors
  
  belongs_to :room
  belongs_to :patient
  
  validates_presence_of :bed_number
  validate :can_accommodate_bed
  
  # Method to determine if bed is occupied.
  # 
  #
  # Returns true if patient is assigned or false if not.
  def occupied?
    !patient.nil?
  end  
  
  # Method to assign patient to a bed.
  # 
  # PARAMETERS
  #   patient - the patient to be assigned the bed.
  # Raises Exceptions
  #   HmsErrors::Ward::PatientCategoryMismatch
  #   HmsErrors::Ward::NoAvailableBeds
  #
  # Returns true on successful assignment else raises exception
  def assign_patient(patient)
    raise HmsErrors::Ward::PatientCategoryMismatch unless self.room.ward.patient_category == patient.patient_category
    raise HmsErrors::Bed::AlreadyAssigned if self.occupied?
    
    self.patient = patient
    self.save!
    true
  end  
  
  # Method to transfer a bed to another room on the same ward.
  # 
  # PARAMETERS
  #   new_room - the new room to transfer bed to.
  # Raises Exceptions
  #   CannotMoveOffWard
  #
  # Returns true on successful transfer else raises exception
  def transfer(new_room)
    raise HmsErrors::Bed::CannotMoveOffWard unless self.room.ward == new_room.ward
    
    self.room = new_room
    self.save!
    true
  end  
  
private
  def can_accommodate_bed
    if room.beds.size > 4
      errors.add(:bed, "This bed can not be accommodated in the room.")
    end
  end
end
