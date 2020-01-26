class UserDecorator < SimpleDelegator
  def display_releases_count
    @display_releases_count ||= object.releases.count
  end

  def display_estimated_total_worth
    @display_estimated_total_worth ||= object.releases.with_discogs_lowest_price.sum(&:discogs_lowest_price)
  end

  def display_most_valuable_release
    @display_most_valuable_release ||= object.releases.with_discogs_lowest_price.maximum(:discogs_lowest_price)
  end

  def object
    @object ||= __getobj__
  end
end
