class LibraryController < ApplicationController
  def show
    @pagy, @releases = pagy(Release.of_user(current_user).ordered)
  end
end
