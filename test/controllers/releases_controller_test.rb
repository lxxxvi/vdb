require 'test_helper'

class ReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:pete)
    sign_in @user
  end

  test 'creates a new release' do
    discogs_release_id = '6990537'
    discogs_release_stub(@user, discogs_release_id)

    assert_difference -> { Release.count } do
      post releases_path, params: { release: { discogs_release_id: discogs_release_id } }
    end

    Release.last.tap do |release|
      assert_equal '87trees', release.name
    end
  end

  test 'updates an existing release' do
    release = releases(:release_virgen_india)
    discogs_release_stub(@user, release.discogs_release_id)

    release.update(label: nil)
    assert_no_difference -> { Release.count } do
      assert_changes -> { release.reload.label }, from: nil, to: 'CBS' do
        post releases_path, params: { release: { discogs_release_id: release.discogs_release_id } }
      end
    end
  end
end
