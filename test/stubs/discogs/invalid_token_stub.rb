module Discogs
  class InvalidTokenStub < BaseStub
    def initialize(user)
      @user = user
    end

    def status
      401
    end

    def url
      "#{search_endpoint}?catno=FOOBAR&f=json&per_page=10&q&token=#{@user.discogs_token}&type=release"
    end

    def response_fixture_file_path
      'json/discogs_invalid_token.json'
    end
  end
end
