class Hospital < ActiveRecord::Base
  has_many :patient_categories
  has_many :wards
  
  validates_presence_of :name
end
