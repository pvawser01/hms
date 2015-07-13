require 'test_helper'

class WardTest < ActiveSupport::TestCase
  
  test 'Ward saves with valid paramters' do
    hospital = hospitals(:one)
    ward = hospital.wards.create(name: 'ward 1', patient_category: patient_categories(:emergency))
    assert ward.valid?, 'Ward did not save when valid paramters.'   
  end  
    
  test 'Ward wont save without name' do
    hospital = hospitals(:one)
    ward = hospital.wards.create(patient_category: patient_categories(:emergency))
    assert_not ward.valid?, 'The Ward should not save when missing name.'
  end    
  
  test 'Ward#find_available_bed returns bed object if available' do
    ward = wards(:emergency)
    assert ward.find_available_bed == beds(:eme1b1), 'Bed wasnt found when available'
  end
  
  test 'Ward#find_available_bed returns false if no beds available' do
    ward = wards(:infectious)
    assert_not ward.find_available_bed, 'Bed was found when no beds available'
  end
  
  
end
