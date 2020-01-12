module ApplicationHelper
  def offline_mode?
    Rails.configuration.offline_mode
  end
end
