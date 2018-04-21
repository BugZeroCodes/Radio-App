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
end
