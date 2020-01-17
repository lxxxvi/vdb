require 'stubs/discogs_stubs'
require 'stubs/discogs_stubs/search'

module StubsHelper
  def discogs_search_stub(foo)
    DiscogsStubs::Search.new(foo)
  end
  # def discogs_release_stub(discogs_id)
  #   stub_request(:get, discogs_releases_endpoint_url(discogs_id))
  #     .with(headers: discogs_headers)
  #     .to_return(
  #       status: 200,
  #       body: discogs_release_response_body(discogs_id).read,
  #       headers: {}
  #     )
  # end

  # def discogs_releases_endpoint_url(discogs_id)
  #   "https://api.discogs.com/releases/#{discogs_id}?f=json&token=#{Rails.configuration.discogs_token}"
  # end

  # def discogs_headers
  #   {
  #     'Accept'=>'application/json',
  #     'Accept-Encoding'=>'gzip,deflate',
  #     'User-Agent'=>'VDB'
  #   }
  # end

  # def discogs_release_response_body(discogs_id)
  #   file_fixture("json/discogs_release_#{discogs_id}.json")
  # end

  # def discogs_search_stub(catalog_number)
  #   Stubs::Discogs::Search.new(catalog_number).stub
  # end
end
