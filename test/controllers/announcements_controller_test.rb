require 'test_helper'

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  teardown do
    User.destroy_all
    Announcement.destroy_all
  end

  # authentication tests
  test 'index redirected if not authenticated' do
    get announcements_path

    assert_response :redirect
  end

  test 'show redirected if not authenticated' do
    announcement = create(:announcement)

    get announcement_path(announcement)

    assert_response :redirect
  end

  # index action
  [:beginner, :admin].each do |role|
    test "logged in #{role} views index" do

      3.times do |n|
        create(:announcement, text: "Announcement #{n}")
      end

      sign_in create(role)
      get announcements_path

      assert_equal assigns(:announcements), Announcement.all
      assert_response :success
      assert_template 'announcements/index'
    end
  end

  # show action
  [:beginner, :admin].each do |role|
    test "logged in #{role} views show" do
      announcement = create(:announcement)

      sign_in(create(role))
      get announcement_path(announcement)

      assert_equal assigns(:announcement), announcement
      assert_response :success
      assert_template 'announcements/show'
    end
  end
end
