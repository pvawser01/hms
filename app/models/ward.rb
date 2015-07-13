class Ward < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :patient_category
  has_many :rooms
end
