require 'test_helper'

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Index actions
  # Unauthenticated 1/4
  test "unauthenticated user redirected from index" do
    get readings_index_url
    assert_response :redirect
    assert response.redirect_url.match?(new_user_session_path)
  end

  # Authenticated 1/4
  test "authenticated user in index" do
    sign_in(create(:beginner))
    get readings_index_url
    assert_response :success
  end

  # Show actions
  # Unauthenticated 2/4
  test "unauthenticated user redirected from show" do
    get readings_show_url
    assert_response :redirect
    assert response.redirect_url.match?(new_user_session_path)
  end

  # Authenticated 2/4
  test "authenticated user in show" do
    sign_in(create(:beginner))
    get readings_show_url
    assert_response :success
  end

  # New actions
  # Unauthenticated 3/4
  test "unauthenticated user redirected from new" do
    get readings_new_url
    assert_response :redirect
    assert response.redirect_url.match?(new_user_session_path)
  end

  # Authenticated 3/4
  test "authenticated user redirected from new" do
    sign_in(create(:beginner))
    get readings_new_url
    assert_response :success
  end

  # Edit actions
  # Unauthenticated 4/4
  test "unauthenticated user redirected from edit" do
    get readings_edit_url
    assert_response :redirect
    assert response.redirect_url.match?(new_user_session_path)
  end

  # Authenticated 4/4
  test "authenticated user in edit" do
    sign_in(create(:beginner))
    get readings_edit_url
    assert_response :success
  end
end
