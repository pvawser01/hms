require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  test 'Room saves with valid paramters' do
    ward = wards(:emergency).rooms.create(name: 'my room')
    assert ward.valid?, 'Room did not save when name provided.'   
  end  
    
  test 'Room wont save without name' do
    ward = wards(:emergency).rooms.create({})
    assert_not ward.valid?, 'The room should not save when missing name.'
  end

end
