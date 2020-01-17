require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test '#GET /search' do
    discogs_search_stub('HSH005')
    get search_path(search_catno: 'HSH005')
    assert_response :success
  end
end
