require 'stubs'

module Stubs
  module Discogs
    class Search
      include Stubs

      def initialize(catalog_number)
        @catalog_number = catalog_number
      end

      def stub
        stub_request(:get, url)
          .with(headers: discogs_headers)
          .to_return(
            status: 200,
            body: discogs_search_result_body,
            headers: {}
          )
      end

      private

      def url
        "https://api.discogs.com/database/search?catno=#{@catalog_number}&f=json&per_page=10&q&token=#{Rails.configuration.discogs_token}&type=release"
      end

      def discogs_search_result_body
        file_fixture("json/discogs_search_result_#{@catalog_number.downcase}.json")
      end
    end
  end
end
