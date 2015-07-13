class Room < ActiveRecord::Base
  belongs_to :ward
  has_many :beds
end
