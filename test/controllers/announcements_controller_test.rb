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

  test 'new redirected if not authenticated' do
    get new_announcement_path

    assert_response :redirect
  end

  test 'create redirected if not authenticated' do
    post announcements_path(attributes_for(:announcement))

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

  # new action
  test 'admin can view new' do
    sign_in create(:admin)

    get new_announcement_path

    refute assigns(:announcement).persisted?
    assert_response :success
    assert_template 'announcements/new'
  end

  # test 'beginner CANNOT view new'

  test 'admin can view edit' do
    announcement = create(:announcement)
    sign_in create(:admin)

    get edit_announcement_path(announcement)

    assert_equal announcement, assigns(:announcement)
    assert_response :success
    assert_template 'announcements/edit'
  end

  # create action
  # context: admin
  test 'admin can create an announcement' do
    sign_in create(:admin)

    assert_difference('Announcement.count', 1) do
      post announcements_path(announcement: attributes_for(:announcement))
    end

    assert_response :success
    assert_template 'announcements/show'
  end

  # create action
  # context: beginner

  # test 'beginner CANNOT create an announcement'
end
