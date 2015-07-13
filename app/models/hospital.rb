class Hospital < ActiveRecord::Base
  has_many :patient_categories
  has_many :wards
end
