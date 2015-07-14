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
  
  test 'Ward#admit! can admit patient with the same patinet category and has available beds' do
    patient = patients(:patient1)
    admitted = wards(:emergency).admit!( patient )
    assert admitted, 'The patient should have been admitted when patient category matches wards category.'
  end  
  
  test 'Ward#admit! can not admit patient to a ward that has no empty beds' do
    patient = patients(:patient3)
    assert_raises(HmsErrors::Ward::NoAvailableBeds) { wards(:stable).admit!( patient ) }
  end
  
end
