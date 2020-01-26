require 'test_helper'

class UserDecoratorTest < ActiveSupport::TestCase
  test '#display_releases_count' do
    assert_equal 2, decorated_pete.display_releases_count
  end

  test '#display_estimated_total_worth' do
    assert_changes -> { decorated_pete.display_estimated_total_worth }, from: 2.1, to: 202.1 do
      set_discogs_lowest_price_for_release(releases(:release_streisand), 200.0)
    end
  end

  test '#display_most_valuable_release' do
    assert_changes -> { decorated_pete.display_most_valuable_release }, from: 2.1, to: 200.0 do
      set_discogs_lowest_price_for_release(releases(:release_streisand), 200.0)
    end
  end

  private

  def decorated_pete
    UserDecorator.new(users(:pete))
  end

  def set_discogs_lowest_price_for_release(release, price)
    release.update(discogs_lowest_price: price)
  end
end
