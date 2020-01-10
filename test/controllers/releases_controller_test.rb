require 'test_helper'

class ReleasesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get releases_path
    assert_response :success
  end

  test 'creates a new release' do
    assert false, 'to implement'
  end

  test 'updates an existing release' do
    release = releases(:release_virgen_india)
    discogs_release_stub(release.discogs_id)

    release.update(label: nil)
    assert_no_difference -> { Release.count } do
      assert_changes -> { release.reload.label }, from: nil, to: 'CBS' do
        post releases_path, params: { release: { discogs_id: release.discogs_id } }
      end
    end
  end
end
