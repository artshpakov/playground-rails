Playground::Application.routes.draw do

  root :to => 'welcome#index'

  devise_for :users, :skip => [:session, :registration]
  as :user do
    post "/signup"    => "devise/registrations#create"
    post "/auth"      => "auth/sessions#create"
    delete "/auth"    => "auth/sessions#destroy"
  end

end
