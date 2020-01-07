class SearchController < ApplicationController
  def index
    @result = search_discogs(params[:search_catno])
  end

  private

  def search_discogs(query)
    return [] if query.nil?

    Rails.configuration
         .discogs_wrapper
         .search(nil, per_page: 10, type: :release, catno: query)
         .results
  end
end
