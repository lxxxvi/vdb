require 'stubs/discogs/base_stub'
require 'stubs/discogs/search_stub'
require 'stubs/discogs/release_stub'
require 'stubs/discogs/invalid_token_stub'

module DiscogsStubs
  def discogs_search_stub(user, catalog_number)
    to_stub(Discogs::SearchStub.new(user, catalog_number).stub_struct)
  end

  def discogs_release_stub(user, discogs_id)
    to_stub(Discogs::ReleaseStub.new(user, discogs_id).stub_struct)
  end

  def invalid_token_stub
    to_stub(Discogs::InvalidTokenStub.new.stub_struct)
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
