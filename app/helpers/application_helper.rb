module ApplicationHelper
  include Pagy::Frontend

  def offline_mode?
    Rails.configuration.offline_mode
  end
end
