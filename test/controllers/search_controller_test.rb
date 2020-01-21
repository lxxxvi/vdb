require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test '#GET /search' do
    user = users(:pete)
    discogs_search_stub(user, 'HSH005')
    sign_in user
    get search_path(search_catno: 'HSH005')
    assert_response :success
  end
end
