require 'application_system_test_case'

class DiscogsTokensTest < ApplicationSystemTestCase
  test 'update the discogs token' do
    sign_in_as :pete

    click_on 'Profile'
    click_on 'Set token'

    assert_selector 'h1', text: 'Set your discogs token'
    assert_selector 'a', text: 'Cancel'

    fill_in 'Discogs token', with: 'thenewtoken'
    click_on 'Set token'

    assert_selector '.discogs-token', text: 'thenewtoken'
  end

  test 'sees information about the missing discogs token' do
    users(:pete).update(discogs_token: nil)

    sign_in_as :pete

    click_on 'Profile'

    assert_selector '.discogs-token',
                    text: 'In order to use the search functionality, you need to configure your discogs token'
  end
end
