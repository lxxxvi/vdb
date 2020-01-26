require 'stubs/discogs/base_stub'
require 'stubs/discogs/search_stub'
require 'stubs/discogs/release_stub'
require 'stubs/discogs/invalid_token_stub'
require 'stubs/discogs/identity_stub'

module DiscogsStubs
  def discogs_search_stub(user, catalog_number)
    to_stub(Discogs::SearchStub.new(user, catalog_number).stub_struct)
  end

  def discogs_release_stub(user, discogs_release_id)
    to_stub(Discogs::ReleaseStub.new(user, discogs_release_id).stub_struct)
  end

  def discogs_invalid_token_stub(user)
    to_stub(Discogs::InvalidTokenStub.new(user).stub_struct)
  end

  def discogs_identity_stub(user, status = :valid)
    to_stub(Discogs::IdentityStub.new(user, status).stub_struct)
  end

  def to_stub(stub_struct)
    stub_request(:get, stub_struct.url)
      .with(headers: stub_struct.request_headers)
      .to_return(
        status: stub_struct.response_status,
        body: file_fixture(stub_struct.response_fixture_file_path).read,
        headers: {}
      )
  end
end
