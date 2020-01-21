module Discogs
  class SearchStub < BaseStub
    def initialize(user, catalog_number)
      @user = user
      @catalog_number = catalog_number
    end

    def url
      "#{search_endpoint}?#{parameters}"
    end

    def response_fixture_file_path
      "json/discogs_search_result_#{@catalog_number.downcase}.json"
    end

    def parameters
      "catno=#{@catalog_number}&f=json&format=vinyl&per_page=10&q&token=NO-DISCOGS-TOKEN&type=release"
    end
  end
end
