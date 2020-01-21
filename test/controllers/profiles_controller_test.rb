require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    sign_in users(:pete)
    get profile_path
    assert_response :success
  end
end
