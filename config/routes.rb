Playground::Application.routes.draw do

  root :to => 'welcome#index'

  devise_for :users,  :skip => [:session, :registration],
                      :path => "auth",
                      :controllers => { omniauth_callbacks: 'auth/callbacks'}
  as :user do
    post "/signup"    => "devise/registrations#create"
    post "/auth"      => "auth/sessions#create"
    delete "/auth"    => "auth/sessions#destroy"
  end

end
