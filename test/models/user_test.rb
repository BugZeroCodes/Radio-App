require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it has a valid factory' do
    assert build(:user).valid?
  end
  test 'has many readings' do
    assert_equal :has_many, User.reflect_on_association(:readings).macro
  end
end
