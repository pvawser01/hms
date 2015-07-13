# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hospital = Hospital.create(name: 'My Hospital')

%w(EMERGENCY INFECTIOUS RECOVERY STABLE).each_with_index do |category, index|
  
  patient_category = hospital.patient_categories.create(name: category)
  
  ward = hospital.wards.create(name: category.titleize, patient_category: patient_category)
  
  # Create rooms
  [1..index].each do |room_number|
    room = ward.rooms.create(name: room_number)  
    # Create room beds
    required_beds = (category == 'INFECTIOUS') ? 1 : 4
    [1..required_beds].each do |bed_number| 
      room.beds.create(bed_number: bed_number)
    end
  end  
end  



