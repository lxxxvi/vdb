module Discogs
  class ReleaseStub < BaseStub
    def initialize(user, discogs_release_id)
      @user = user
      @discogs_release_id = discogs_release_id
    end

    def url
      "https://api.discogs.com/releases/#{@discogs_release_id}?f=json&token=NO-DISCOGS-TOKEN"
    end

    def response_fixture_file_path
      "json/discogs_release_#{@discogs_release_id}.json"
    end
  end
end
