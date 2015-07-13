class PatientCategory < ActiveRecord::Base
  belongs_to :hospital
  has_many :wards
  has_many :patients
  
  validates_presence_of :name
end
