class Patient < ActiveRecord::Base
  belongs_to :bed
  belongs_to :patient_category
end
