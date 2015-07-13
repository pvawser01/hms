class PatientCategory < ActiveRecord::Base
  belongs_to :hospital
  has_many :wards
  has_many :patients
end
