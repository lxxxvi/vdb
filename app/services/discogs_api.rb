class DiscogsApi
  def self.for(user)
    Discogs::Wrapper.new('VDB', user_token: user.discogs_token)
  end
end
