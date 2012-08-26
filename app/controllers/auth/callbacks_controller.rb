class Auth::CallbacksController < Devise::OmniauthCallbacksController

  def all
    user = User.from_omniauth request.env['omniauth.auth']
    sign_in user
    gon.rabl :template => "app/views/auth/sessions/create.json.rabl", :as => :current_user
    render 'auth/callbacks/all', :layout => false
  end

  alias_method :twitter, :all
  alias_method :github, :all
  alias_method :facebook, :all

end
