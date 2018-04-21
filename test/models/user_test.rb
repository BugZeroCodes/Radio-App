require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it has a valid factory' do
    assert build(:user).valid?
  end
end
