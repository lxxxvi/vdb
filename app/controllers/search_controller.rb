class SearchController < ApplicationController
  def index
    @search = DiscogsSearch.new(current_user, params[:search_catno])
  end
end
