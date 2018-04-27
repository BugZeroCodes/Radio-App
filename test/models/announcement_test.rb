require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  test 'it has a valid factory' do
    assert build(:announcement).valid?
  end
  test 'announcements have many readings' do
    assert_equal :has_many, Announcement.reflect_on_association(:readings).macro
  end
  test 'invalid without text' do
    assert build(:announcement, text: nil).invalid?
  end
  test 'announcement has expired' do
    assert build(:announcement, expires_at: nil).invalid?
  end
end
