module ApplicationHelper

  def omniauth_link provider, options={}
    link_to options[:text] || '',
      user_omniauth_authorize_path(provider),
      :class => (options[:class] || "popup #{provider}"), :"data-height" => 800, :"data-width" => 700
  end

end
