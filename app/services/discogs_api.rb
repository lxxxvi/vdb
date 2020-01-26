class DiscogsApi
  def self.for(user)
    Discogs::Wrapper.new('VDB', user_token: user.discogs_token)
  end

  def self.identity(user)
    self.for(user).get_identity
  end

  def self.identity_status(user)
    identity(user).username.nil? ? :invalid : :valid
  end
end
