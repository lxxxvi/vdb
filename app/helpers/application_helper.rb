module ApplicationHelper
  include Pagy::Frontend

  def offline_mode?
    Rails.configuration.offline_mode
  end

  def nav_link_to(body, url, options = {})
    pattern = options.delete(:active_on)
    css_classes = options[:class]
    css_classes += ' nav-link-active' if request_path_matches?(pattern)
    options[:class] = css_classes

    link_to body, url, options
  end

  def request_path_matches?(pattern)
    return if pattern.nil?

    request.path.match?(pattern)
  end
end
