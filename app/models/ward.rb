class Ward < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :patient_category
  has_many :rooms
  
  validates_presence_of :name
  
  # Method to find the first available bed on a ward.
  # 
  #
  # Returns bed object on success or error on failure
  # def find_available_bed
  #     self.beds.
  #   end  
end
