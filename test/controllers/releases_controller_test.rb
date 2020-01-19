require 'test_helper'

class ReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:pete)
    sign_in @user
  end

  test 'should get index' do
    get releases_path
    assert_response :success
  end

  test 'creates a new release' do
    discogs_id = 6990537 # see ./test/fixtures/files/json/discogs_release_6990537.json
    discogs_release_stub(discogs_id, @user)

    assert_difference -> { Release.count } do
      post releases_path, params: { release: { discogs_id: discogs_id } }
    end

    Release.last.tap do |release|
      assert_equal '87trees', release.name
    end
  end

  test 'updates an existing release' do
    release = releases(:release_virgen_india)
    discogs_release_stub(release.discogs_id, @user)

    release.update(label: nil)
    assert_no_difference -> { Release.count } do
      assert_changes -> { release.reload.label }, from: nil, to: 'CBS' do
        post releases_path, params: { release: { discogs_id: release.discogs_id } }
      end
    end
  end
end
