require 'test_helper'

class DiscogsApiTest < ActiveSupport::TestCase
  test '.identity' do
    user = users(:pete)
    discogs_identity_stub(user)
    assert_equal 'pete@rock.dev', DiscogsApi.identity(user).username
  end

  test '.identity_status valid' do
    user = users(:pete)
    discogs_identity_stub(user, :valid)
    assert_equal :valid, DiscogsApi.identity_status(user)
  end

  test '.identity_status invalid' do
    user = users(:pete)
    discogs_identity_stub(user, :invalid)
    assert_equal :invalid, DiscogsApi.identity_status(user)
  end
end
