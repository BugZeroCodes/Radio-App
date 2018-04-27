require 'test_helper'

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'redirected if not authenticated' do
    get announcements_path
    assert_redirected_to new_user_session_path
  end

  test 'logged in beginner views index' do
    sign_in create(:beginner)
    get announcements_path
    assert_response :success
    assert_match '<h2>Announcements</h2>', @response.body
  end
end
