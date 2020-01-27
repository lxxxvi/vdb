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
    sign_in_as(:pete)

    visit library_path
    click_on 'Add release'
    assert_selector 'h1', text: 'Add release'

    within('.discogs-release-id-form') do
      fill_in 'Discogs Relase ID', with: 6990537

      click_on 'Add release'
    end

    assert_selector '.flash-success', text: 'Release created'
  end
end
