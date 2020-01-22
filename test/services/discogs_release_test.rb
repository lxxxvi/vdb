require 'test_helper'

class DiscogsReleaseTest < ActiveSupport::TestCase
  test '#to_release' do
    user = users(:pete)

    discogs_release_id = 6990537 # rubocop:disable Style/NumericLiterals

    discogs_release_stub(user, discogs_release_id)

    DiscogsRelease.find(discogs_release_id, user).to_release.tap do |release|
      assert release.is_a?(Release)

      assert_equal 'HSH005', release.catalog_number
      assert_equal 'Home Street Home Records', release.label
      assert_equal 'Home Street Home', release.artist
      assert_equal '87trees', release.name
      assert_equal '2015', release.year
      assert_equal 'Electronic, Hip Hop', release.genre
      assert_equal 'CD', release.format
      assert_equal 1, release.format_quantity
      assert_equal 3, release.discogs_community_have
      assert_equal 1, release.discogs_community_want
      assert_equal 22.33, release.discogs_lowest_price
      assert_equal 0, release.discogs_number_for_sale
      assert_equal 'https://img.discogs.com/label-uri150.jpg', release.discogs_cover_thumb_url
      assert_equal 'https://api.discogs.com/releases/6990537', release.discogs_api_resource_url
      assert_equal 'https://www.discogs.com/Home-Street-Home-87trees/release/6990537', release.discogs_uri
    end
  end
end
