module Discogs
  class SearchStub < BaseStub
    def initialize(user, catalog_number)
      @user = user
      @catalog_number = catalog_number
    end

    def url
      "#{search_endpoint}?catno=#{@catalog_number}&f=json&per_page=10&q&token=#{@user.discogs_token}&type=release"
    end

    def response_fixture_file_path
      "json/discogs_search_result_#{@catalog_number.downcase}.json"
    end
  end
end
