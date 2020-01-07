module ApplicationHelper
  def offline_mode?
    Rails.configuration.settings.offline_mode && !Rails.env.production?
  end
end
