require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  test 'it has a valid factory' do
    assert build(:reading).valid?
  end
  test 'belongs to user' do
    assert_equal :belongs_to, Reading.reflect_on_association(:user).macro
  end
  test 'belongs to announcement' do
    assert_equal :belongs_to, Reading.reflect_on_association(:announcement).macro
  end
end
