require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  test 'it has a valid factory' do
    assert build(:announcement).valid?
  end
end
