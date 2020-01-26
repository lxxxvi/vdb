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
end
