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
  
end
