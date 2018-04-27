require 'test_helper'

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    3.times do |n|
      create(:announcement, text: "Announcement #{n}")
    end
  end

  teardown do
    User.destroy_all
    Announcement.destroy_all
  end

  test 'redirected if not authenticated' do
    get announcements_path
    assert_redirected_to new_user_session_path
  end

  test 'logged in beginner views index' do
    sign_in create(:beginner)

    get announcements_path
    assert_response :success
    assert_equal assigns(:announcements), Announcement.all
    assert_match '<h2>Announcements</h2>', @response.body
    Announcement.all.each do |announcement|
      assert_no_match 'Edit', @response.body
      assert_no_match 'Delete', @response.body
      assert_match announcement.text, @response.body
      assert_match announcement.expires_at.strftime('%m-%d-%Y'), @response.body
    end
  end

  test 'logged in admin sees edit and delete buttons' do
    sign_in create(:admin)

    get announcements_path
    assert_response :success

    assert_match 'Edit', @response.body
    assert_match 'Delete', @response.body
  end
end
