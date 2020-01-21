require 'test_helper'

class DiscogsSearchTest < ActiveSupport::TestCase
  setup do
    @user = users(:pete)
  end

  test '#no_discogs_token?' do
    assert_changes -> { DiscogsSearch.new(@user, nil).no_discogs_token? }, to: true do
      @user.discogs_token = nil
    end
  end

  test '#invalid_token?' do
    invalid_token_stub
    assert DiscogsSearch.new(@user, 'FOOBAR').invalid_token?
  end

  test '#empty_query?' do
    assert DiscogsSearch.new(@user, '').empty_query?
  end

  test '#empty_result?' do
    discogs_search_stub('empty', @user)
    assert DiscogsSearch.new(@user, 'empty').empty_result?
  end

  test '#results' do
    discogs_search_stub('hsh005', @user)
    assert DiscogsSearch.new(@user, 'hsh005').results.any?
  end
end
