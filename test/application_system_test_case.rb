require 'test_helper'
require 'capybara/rails'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :rack_test

  teardown do
    sign_out
  end

  def sign_in_as(username)
    user = users(username)

    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'abc'

    within('form') do
      click_on 'Sign in'
    end

    assert_selector 'h1', text: 'Library'
  end

  def sign_out
    return unless has_css?('footer')

    within('footer') do
      click_on 'Sign out'
    end
  end
end
