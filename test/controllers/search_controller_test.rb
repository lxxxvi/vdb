require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test '#GET /search' do
    user = users(:pete)
    sign_in user
    discogs_search_stub('HSH005', user)
    get search_path(search_catno: 'HSH005')
    assert_response :success
  end
end
