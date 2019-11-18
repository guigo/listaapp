Rails.application.routes.draw do

  get 'products/index'
  namespace :portal do
    get 'home', to: 'home#index'
    resources :products
    resources :order_items
    resource :carts, only: [:show]
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
