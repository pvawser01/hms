require 'test_helper'

class HospitalTest < ActiveSupport::TestCase
  
  test 'Hospital saves with valid name' do
    hospital = Hospital.create(name: 'my hospital')
    assert hospital.valid?, 'Hospital did not save when name provided.'   
  end  
  
  test 'Hospital wont save without name' do
    hospital = Hospital.create({})
    assert_not hospital.valid?, 'The hospital should not save when missing name.'   
  end

end
