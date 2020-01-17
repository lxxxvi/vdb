class DiscogsStubs
  def discogs_search_stub(catalog_number)
    Search.new(catalog_number)
  end

  def self.default_headers
    {
      'Accept'=>'application/json',
      'Accept-Encoding'=>'gzip,deflate',
      'User-Agent'=>'VDB'
    }
  end
end
