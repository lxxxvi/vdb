require 'application_system_test_case'

class ReleasesTest < ApplicationSystemTestCase
  test 'visits the index' do
    visit releases_path
    assert_selector 'h1', text: 'Releases'
  end

  test 'creates a new release' do
    raise 'implement me'
  end
end
