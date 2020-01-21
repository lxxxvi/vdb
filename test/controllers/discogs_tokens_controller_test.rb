require 'test_helper'

class DiscogsTokensControllerTest < ActionDispatch::IntegrationTest
  test 'should get edit' do
    sign_in users(:pete)
    get edit_discogs_token_path
    assert_response :success
  end

  test 'create discogs_token' do
    user = users(:pete)
    sign_in user

    assert_changes -> { user.reload.discogs_token }, to: 'NEW-TOKEN' do
      patch discogs_token_path, params: { user: { discogs_token: 'NEW-TOKEN' } }
    end

    follow_redirect!
    assert_response :success
  end
end
