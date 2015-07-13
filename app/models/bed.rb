class Bed < ActiveRecord::Base
  belongs_to :room
  has_one :patient
  
  validates_presence_of :bed_number
  validate :can_accommodate_bed
  
private
  def can_accommodate_bed
    if room.beds.size >= 4
      errors.add(:bed, "This bed can not be accommodated in the room.")
    end
  end
end
