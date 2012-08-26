class Auth::SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate! auth_options
    sign_in resource_name, resource
  end

  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render :text => nil, :status => :no_content
  end

end
