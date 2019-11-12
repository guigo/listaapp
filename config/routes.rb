Rails.application.routes.draw do

  namespace :portal do
    get 'home', to: 'home#index'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  devise_scope :user do
    root to: "devise/sessions#new"
    get "/login", to: "devise/sessions#new"
    get '/sign_out' => "devise/sessions#destroy"
    get "/signup", to: "devise/registrations#new"
  end

  get 'portal', to: 'portal/home#index'

end
