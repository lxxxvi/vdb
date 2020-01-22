# rubocop:disable Rails/Delegate
class DiscogsRelease
  attr_reader :model, :user

  def initialize(model, user)
    @model = model
    @user = user
  end

  def self.find(discogs_release_id, user)
    new(DiscogsApi.for(user).get_release(discogs_release_id), user)
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def to_release
    user.releases.find_or_initialize_by(discogs_release_id: discogs_release_id).tap do |release|
      release.catalog_number = catalog_number
      release.label = label
      release.artist = artist
      release.name = name
      release.year = year
      release.genre = genre
      release.format = format
      release.format_quantity = format_quantity
      release.discogs_community_have = discogs_community_have
      release.discogs_community_want = discogs_community_want
      release.discogs_lowest_price = discogs_lowest_price
      release.discogs_number_for_sale = discogs_number_for_sale
      release.discogs_cover_thumb_url = discogs_cover_thumb_url
      release.discogs_api_resource_url = discogs_api_resource_url
      release.discogs_uri = discogs_uri
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def catalog_number
    model.labels.first.catno
  end

  def label
    model.labels.first.name
  end

  def artist
    Array(model.artists).reduce('') do |acc, item|
      "#{acc}#{item[:name]}#{item[:join]}"
    end
  end

  def name
    model.title
  end

  def year
    model.year
  end

  def genre
    model.genres.join(', ')
  end

  def format
    model.formats&.first&.name
  end

  def format_quantity
    model.format_quantity
  end

  def discogs_release_id
    model.id
  end

  def discogs_community_have
    model.community[:have]
  end

  def discogs_community_want
    model.community[:want]
  end

  def discogs_lowest_price
    model.lowest_price
  end

  def discogs_number_for_sale
    model.num_for_sale
  end

  def discogs_cover_thumb_url
    model.images.first.uri150
  end

  def discogs_api_resource_url
    model.resource_url
  end

  def discogs_uri
    model.uri
  end
end
# rubocop:enable Rails/Delegate
