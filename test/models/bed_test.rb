require 'test_helper'

class BedTest < ActiveSupport::TestCase
  
  test 'Bed saves with bed_number provided' do
    bed = rooms(:inf1).beds.create(bed_number: 'EME1-B1')
    assert bed.valid?, 'Bed did not save when bed_number provided.'   
  end  
    
  test 'Bed wont save without bed_number' do
    bed = rooms(:inf1).beds.create({})
    assert_not bed.valid?, 'The bed should not save when missing bed_number.'
  end
  
  test 'Bed can not be saved if associated room already has 4 beds' do
    bed = rooms(:eme1).beds.create(bed_number: 'Spare')
    assert_not bed.valid?, 'The bed should not save when room is full.'
  end
  
  test '#occupied?' do
    bed = beds(:eme1b1)
    assert_not bed.occupied?, 'The bed should not be occupied when no patient is assigned.'
    bed.patient = patients(:patient1)
    assert bed.occupied?, 'The bed should be occupied when a patient is assigned.'
  end
  
end
