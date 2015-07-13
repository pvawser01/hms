class Bed < ActiveRecord::Base
  belongs_to :room
  has_one :patient
end
