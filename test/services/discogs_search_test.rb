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
    discogs_invalid_token_stub(@user)
    assert DiscogsSearch.new(@user, 'FOOBAR').invalid_token?
  end

  test '#empty_query?' do
    assert DiscogsSearch.new(@user, '').empty_query?
  end

  test '#empty_result?' do
    discogs_search_stub(@user, 'empty')
    assert DiscogsSearch.new(@user, 'empty').empty_result?
  end

  test '#results' do
    discogs_search_stub(@user, 'hsh005')
    assert DiscogsSearch.new(@user, 'hsh005').results.any?
  end
end
