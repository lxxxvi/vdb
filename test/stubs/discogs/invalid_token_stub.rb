module Discogs
  class InvalidTokenStub < BaseStub
    def url
      "#{search_endpoint}?catno=FOOBAR&f=json&format=vinyl&per_page=10&q&token=NO-DISCOGS-TOKEN&type=release"
    end

    def response_fixture_file_path
      'json/discogs_invalid_token.json'
    end
  end
end
