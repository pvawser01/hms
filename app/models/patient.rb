class Patient < ActiveRecord::Base
  
  include HmsErrors
  
  belongs_to :patient_category
  has_one :bed
  
  validates_presence_of :first_name, :surname, :date_of_birth
  
  
  
end
