require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  
  test 'Patient saves with valid parameters' do
    patient = Patient.create(first_name: 'Ben', surname: 'Harper', date_of_birth: '01 Jan 1963')
    assert patient.valid?, 'Patient did not save when valid parameters provided.'   
  end  
  
  test 'Patient wont save without first name' do
    patient = Patient.create(surname: 'Harper', date_of_birth: '01 Jan 1963')
    assert_not patient.valid?, 'The Patient should not save when missing first name.'   
  end
  
  test 'Patient wont save without surname' do
    patient = Patient.create(first_name: 'Ben', date_of_birth: '01 Jan 1963')
    assert_not patient.valid?, 'The Patient should not save when missing surname.'   
  end
  
  test 'Patient wont save without date_of_birth' do
    patient = Patient.create(first_name: 'Ben', surname: 'Harper')
    assert_not patient.valid?, 'The Patient should not save when missing date_of_birth.'   
  end
  
  # test 'Patient can be addmitted to a ward that has an empty bed' do
  #     patient = patients(:patient1)
  #     patient.admit!(wards(:emergency))
  #     
  #   end  
  
  
end
