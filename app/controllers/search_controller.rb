class SearchController < ApplicationController
  FAKE_RESULT_PATH = Rails.root.join('test/fixtures/files/discogs_search_result_hashie.marshal').freeze

  def index
    @result = search_discogs(params[:search_catno])
  end

  private

  def search_discogs(query)
    return [] if query.nil?
    return fake_result if helpers.offline_mode?

    Rails.configuration
         .discogs_wrapper
         .search(nil, per_page: 10, type: :release, catno: query)
         .results
  end


  def fake_result
    Marshal.load(File.binread(FAKE_RESULT_PATH.to_s))
  end
end
