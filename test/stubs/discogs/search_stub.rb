module Discogs
  class SearchStub < BaseStub
    def initialize(catalog_number)
      @catalog_number = catalog_number
    end

    def url
      "https://api.discogs.com/database/search?catno=#{@catalog_number}&f=json&per_page=10&q&token=#{Rails.configuration.discogs_token}&type=release"
    end

    def response_fixture_file_path
      "json/discogs_search_result_#{@catalog_number.downcase}.json"
    end
  end
end
