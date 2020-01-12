class ReleasesController < ApplicationController
  def index
    @releases = Release.ordered
  end

  def create
    discogs_release = DiscogsRelease.find(release_params[:discogs_id])

    release = discogs_release.to_release

    if release.save
      flash[:notice] = 'Release created'
    else
      flash[:notice] = 'Release creation failed'
    end

    redirect_to releases_path
  end

  private

  def release_params
    params.require(:release).permit(:discogs_id)
  end

  def find_release_on_discogs(discogs_id)
    DISCOGS_WRAPPER.get_release(discogs_id)
  end
end
