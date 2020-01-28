require 'application_system_test_case'

class ReleasesTest < ApplicationSystemTestCase
  test 'creates a new release without Discogs Release ID' do
    sign_in_as(:pete)

    visit library_path
    click_on 'Add release'
    assert_selector 'h1', text: 'Add release'
    assert_selector 'a', text: 'Cancel'

    within('.release-form') do
      fill_in 'Catalog #', with: 'M.B. 5'
      fill_in 'Label', with: 'Maison Bourbon'
      fill_in 'Artist', with: 'Jack Cooley'
      fill_in 'Release name', with: 'The yellow dog blues'
      fill_in 'Year', with: '1970'
      fill_in 'Genre', with: 'Dixie'
      fill_in 'Format quantity', with: '1'

      click_on 'Add release'
    end

    assert_selector '.flash-success', text: 'Release created'
  end

  test 'creates a new release using Discogs Relase ID' do
    user = users(:pete)
    sign_in_as(:pete)

    discogs_release_id = '6990537'
    discogs_release_stub(user, discogs_release_id)

    visit library_path
    click_on 'Add release'
    assert_selector 'h1', text: 'Add release'

    within('.release-form') do
      fill_in 'Discogs Release ID', with: discogs_release_id

      click_on 'Add release'
    end

    assert_selector '.flash-success', text: 'Release created'
  end

  test 'removes a release' do
    sign_in_as(:pete)

    visit library_path

    click_on 'Remove', match: :first

    assert_selector '.flash-success', text: 'Release removed'
  end
end
