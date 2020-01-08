require 'test_helper'

class ReleasesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get releases_path
    assert_response :success
  end

  test 'create new release with discogs_id' do
    assert_difference -> { Release.count }, 1 do
      post releases_path, params: { release: { discogs_id: 1234 } }
    end
  end
end
