require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test '#GET /search' do
    get search_path(search_catno: 'HSH001')
    assert_response :success
  end
end
