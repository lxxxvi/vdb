require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  setup do
    @release = releases(:release_virgen_india)
    @new_release = @release.dup
  end

  test 'uniqueness of discogs_release_id within user' do
    other_user = users(:primo)

    assert_changes -> { @new_release.valid? }, to: true do
      @new_release.user = other_user
    end
  end

  test 'uniqueness of label, catalog_number within user' do
    assert_changes -> { @new_release.valid? }, to: true do
      @new_release.discogs_release_id = nil
      @new_release.catalog_number = 'something else'
    end
  end

  test '.with_discogs_lowest_price' do
    assert_difference -> { Release.with_discogs_lowest_price.count }, 1 do
      releases(:release_streisand).update(discogs_lowest_price: 1.0)
    end
  end
end
