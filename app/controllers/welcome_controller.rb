class WelcomeController < ApplicationController

  def index
    gon.rabl :template => "app/views/auth/sessions/create.json.rabl", :as => :current_user
  end

end
