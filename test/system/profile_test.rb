require 'application_system_test_case'

class ProfileTest < ApplicationSystemTestCase
  test 'visit the profile page' do
    sign_in_as :pete

    click_on 'Profile'

    assert_selector 'h1', text: 'Profile'
    assert_selector '.discogs-token', text: 'Your discogs token'
  end
end
