module Discogs
  class IdentityStub < BaseStub
    def initialize(user, status)
      @user = user
      @status = status
    end

    def url
      %r{https://api.discogs.com/oauth/identity\?f=json&token=}
    end

    def response_fixture_file_path
      return 'json/discogs_identity_pete.json' if @status == :valid

      'json/discogs_invalid_token.json'
    end
  end
end
