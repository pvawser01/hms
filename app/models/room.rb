class Room < ActiveRecord::Base
  belongs_to :ward
  has_many :beds
  
  validates_presence_of :name
end
