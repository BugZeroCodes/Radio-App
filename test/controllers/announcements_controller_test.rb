require 'test_helper'

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test 'redirected if not authenticated' do
    get announcements_path
    assert_redirected_to new_user_session_path
  end
end
