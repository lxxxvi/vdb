class ReleasesController < ApplicationController
  def new
    @release = Release.new
  end

  def create
    return handle_with_discogs_id if release_params[:discogs_id].present?

    handle_without_discogs_id
  end

  private

  def handle_with_discogs_id
    discogs_release = DiscogsRelease.find(release_params[:discogs_id], current_user)

    release = discogs_release.to_release

    if release.save
      flash[:success] = 'Release created'
    else
      flash[:alert] = 'Adding release failed!'
    end

    redirect_to library_path
  end

  def handle_without_discogs_id
    @release = current_user.releases.new(release_params)

    if @release.save
      flash[:success] = 'Release created'
      redirect_to library_path
    else
      flash.now[:alert] = 'Please check input'
      render 'new'
    end
  end

  def release_params
    params.require(:release).permit(:discogs_id, :category_number, :label, :artist, :name, :year, :genre,
                                    :format_quantity)
  end
end
