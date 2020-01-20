class DiscogsTokensController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(discogs_token_params)
      redirect_to profile_path
    else
      render 'new'
    end
  end

  private

  def discogs_token_params
    params.require(:user).permit(:discogs_token)
  end
end
