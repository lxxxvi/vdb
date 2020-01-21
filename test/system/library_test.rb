require 'application_system_test_case'

class LibraryTest < ApplicationSystemTestCase
  test 'visits the index' do
    sign_in_as(:pete)

    assert_selector 'h1', text: 'Library'

    visit library_path
    assert_selector 'h1', text: 'Library'
    assert_selector '.test-release-name', text: 'Virgen India'
  end

  test 'visits the index, sees only own releases' do
    sign_in_as(:primo)

    visit library_path
    assert_selector 'h1', text: 'Library'
    assert_selector '.test-release-name', text: 'Virgen India', count: 0
  end
end
