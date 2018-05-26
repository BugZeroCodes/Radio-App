require 'test_helper'

class NewAnnouncementTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  teardown do
    User.destroy_all
    Announcement.destroy_all
  end

  # admin should see New Announcement button on index page
  # beginner should not.
  test 'admin sees New Announcement button on index page' do
    sign_in(create(:admin))

    get announcements_path
    assert_select('#new-announcement', 'New Announcement')
  end

  test 'beginner does not see New Announcement button on index page' do
    sign_in(create(:beginner))

    get announcements_path
    assert_select('#new-announcement', false)
  end

end
