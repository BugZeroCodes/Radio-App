require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it has a valid factory' do
    assert build(:user).valid?
  end
  test 'has many readings' do
    assert_equal :has_many, User.reflect_on_association(:readings).macro
  end
  test 'invalid without DJ Name' do
    assert build(:user, dj_name: nil).invalid?
  end
  test 'invalid without Name' do
    assert build(:user, name: nil).invalid?
  end
  test 'invalid without Role' do
    assert build(:user, role: nil).invalid?
  end
  test 'used up DJ Name' do
    user1 = create(:user)
    user2 = build(:user, dj_name: user1.dj_name)
    assert user2.invalid?
  end
  test 'used up Name' do
    user1 = create(:user)
    user2 = build(:user, name: user1.name)
    assert user2.invalid?
  end
end
