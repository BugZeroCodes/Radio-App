require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  def setup
    @admin_ability = Ability.new(build(:admin))
    @beginner_ability = Ability.new(build(:beginner))
  end
  test 'admin can create announcements' do
    assert @admin_ability.can?(:create, Announcement)
  end
  test 'beginner cannot create announcements' do
    assert @beginner_ability.cannot?(:create, Announcement)
  end
  test 'admin can edit announcements' do
    assert @admin_ability.can?(:update, Announcement)
  end
  test 'beginner cannot edit announcements' do
    assert @beginner_ability.cannot?(:update, Announcement)
  end
  test 'beginner can view announcements' do
    assert @beginner_ability.can?(:read, Announcement)
  end
  test 'admin can view announcements' do
    assert @admin_ability.can?(:read, Announcement)
  end
  test 'admin can manage readings' do
    assert @admin_ability.can?(:manage, Reading)
  end
  test 'beginner can manage readings' do
    assert @beginner_ability.can?(:manage, Reading)
  end
end
