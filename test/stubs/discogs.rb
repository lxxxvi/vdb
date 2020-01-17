require 'stubs/discogs/base_stub'
require 'stubs/discogs/search_stub'
require 'stubs/discogs/release_stub'

module DiscogsStubs
  def discogs_search_stub(catalog_number)
    to_stub(Discogs::SearchStub.new(catalog_number).stub_struct)
  end

  def discogs_release_stub(discogs_id)
    to_stub(Discogs::ReleaseStub.new(discogs_id).stub_struct)
  end

  def to_stub(stub_struct)
    stub_request(:get, stub_struct.url)
      .with(headers: stub_struct.request_headers)
      .to_return(
        status: 200,
        body: file_fixture(stub_struct.response_fixture_file_path).read,
        headers: {}
      )
  end
end
