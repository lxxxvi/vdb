module Discogs
  class ReleaseStub < BaseStub
    def initialize(discogs_id)
      @discogs_id = discogs_id
    end

    def url
      "https://api.discogs.com/releases/#{@discogs_id}?f=json&token=#{Rails.configuration.discogs_token}"
    end

    def response_fixture_file_path
      "json/discogs_release_#{@discogs_id}.json"
    end
  end
end
