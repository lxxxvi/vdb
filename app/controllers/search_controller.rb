class SearchController < ApplicationController
  def index
    @discogs_search = DiscogsSearch.new(current_user, params[:search_catno])
  end
end
