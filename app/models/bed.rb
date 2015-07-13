class Bed < ActiveRecord::Base
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
  
private
  def can_accommodate_bed
    if room.beds.size >= 4
      errors.add(:bed, "This bed can not be accommodated in the room.")
    end
  end
end
