require 'test_helper'

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Index actions
  # Unauthenticated 1/4
  test "unauthenticated user redirected from index" do
    get readings_url
    assert_response :redirect
    assert response.redirect_url.match?(new_user_session_path)
  end

  # Authenticated 1/4
  test "authenticated user in index" do
    create(:reading)
    sign_in(create(:beginner))
    get readings_url
    assert_response :success
  end

  # Show actions
  # Unauthenticated 2/4
  test "unauthenticated user redirected from show" do
    reading = create(:reading)
    get reading_url(id: reading.id)
    assert_response :redirect
    assert response.redirect_url.match?(new_user_session_path)
  end

  # Authenticated 2/4
  test "authenticated user in show" do
    user = create(:beginner)
    reading = create(:reading, user: user)
    sign_in(user)
    get reading_url(id: reading.id)
    assert_response :success
  end

  # New actions
  # Unauthenticated 3/4
  test "unauthenticated user redirected from new" do
    announcement = create(:announcement)
    get new_reading_announcement_url(id: announcement.id)
    assert_response :redirect
    assert response.redirect_url.match?(new_user_session_path)
  end

  # Authenticated 3/4
  test "authenticated user in new" do
    announcement = create(:announcement)
    sign_in(create(:beginner))
    get new_reading_announcement_url(id: announcement.id)
    assert_response :success
  end

  # Edit actions
  # Unauthenticated 4/4
  test "unauthenticated user redirected from edit" do
    reading = create(:reading)
    get edit_reading_url(id: reading.id)
    assert_response :redirect
    assert response.redirect_url.match?(new_user_session_path)
  end

  # Authenticated 4/4
  test "authenticated user in edit" do
    user = create(:beginner)
    reading = create(:reading, user: user)
    sign_in(user)
    get edit_reading_url(id: reading.id)
    assert_response :success
  end
end
