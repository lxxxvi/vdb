module Discogs
  class BaseStub
    StubStruct = Struct.new(:url, :request_headers, :response_fixture_file_path)

    def stub_struct
      StubStruct.new(url, request_headers, response_fixture_file_path)
    end

    def url
      raise 'implement in subclass'
    end

    def search_endpoint
      'https://api.discogs.com/database/search'
    end

    def request_headers
      {
        'Accept' => 'application/json',
        'Accept-Encoding' => 'gzip,deflate',
        'User-Agent' => 'VDB'
      }
    end

    def response_fixture_file_path
      raise 'implement in subclass'
    end
  end
end
