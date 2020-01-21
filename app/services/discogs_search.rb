class DiscogsSearch
  attr_reader :catno

  def initialize(user, catno)
    @user = user
    @catno = catno
  end

  def no_discogs_token?
    @user.discogs_token.blank?
  end

  def invalid_token?
    message&.match?(/^Invalid consumer token/)
  end

  def empty_query?
    @catno.blank?
  end

  def empty_result?
    results.none?
  end

  def message
    @message ||= discogs_search&.message
  end

  def results
    @results ||= discogs_search&.results || []
  end

  private

  def discogs_api
    @discogs_api ||= DiscogsApi.for(@user)
  end

  def discogs_search
    return if @catno.blank?

    @discogs_search ||= discogs_api.search(nil,
                                           per_page: 10,
                                           type: :release,
                                           catno: @catno)
  end
end
