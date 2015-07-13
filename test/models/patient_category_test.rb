require 'test_helper'

class PatientCategoryTest < ActiveSupport::TestCase
  
  test 'PatientCategory saves with valid name' do
    patient_category = hospitals(:one).patient_categories.create(name: 'TEST CAT')
    assert patient_category.valid?, 'PatientCategory did not save when name provided.'   
  end  
  
  test 'PatientCategory wont save without name' do
    patient_category = hospitals(:one).patient_categories.create({})
    assert_not patient_category.valid?, 'The PatientCategory should not save when missing name.'   
  end
  
end
