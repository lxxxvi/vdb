require 'test_helper'

class LibraryControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in users(:pete)
    get library_path
    assert_response :success
  end
end
