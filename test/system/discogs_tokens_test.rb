require 'application_system_test_case'

class DiscogsTokensTest < ApplicationSystemTestCase
  setup do
    sign_in_as :pete
    click_on 'Profile'
  end

  test 'update the discogs token' do
    click_on 'Set token'

    discogs_identity_stub(users(:pete), :valid)

    assert_selector 'h1', text: 'Set your discogs token'
    assert_selector 'a', text: 'Cancel'

    fill_in 'Discogs token', with: 'thenewtoken'
    click_on 'Set token'

    assert_selector '.discogs-token', text: 'thenewtoken'
  end

  test 'sees information about the missing discogs token' do
    users(:pete).update(discogs_token: nil)

    refresh

    assert_selector '.discogs-token',
                    text: 'In order to use the search functionality, you need to configure your discogs token'
  end

  test 'enters valid token and sees status success' do
    discogs_identity_stub(users(:pete), :valid)
    click_on 'Set token'
    fill_in 'Discogs token', with: 'PETES-DISCOGS-TOKEN'
    click_on 'Set token'
    assert_selector '.discogs-token--status', text: 'Valid'
  end

  test 'enters invalid token and sees status error' do
    discogs_identity_stub(users(:pete), :invalid)
    click_on 'Set token'
    fill_in 'Discogs token', with: 'INVALID-TOKEN'
    click_on 'Set token'
    assert_selector '.discogs-token', text: 'INVALID-TOKEN'
    assert_selector '.discogs-token--status', text: 'Invalid'
  end
end
