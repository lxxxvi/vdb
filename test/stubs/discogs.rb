require 'stubs'
require 'stubs/discogs/search'

module Stubs
  module Discogs
    def default_headers
      {
        'Accept'=>'application/json',
        'Accept-Encoding'=>'gzip,deflate',
        'User-Agent'=>'VDB'
      }
    end
  end
end
