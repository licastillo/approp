Rails.application.routes.draw do

  root to: 'search#index'

  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :passwords => 'passwords'
  }

  devise_scope :user do
    get '/salir', to: 'devise/sessions#destroy', as: :signout
  end

  resources :users
  resources :properties
  resources :favorites

  get 'mis-propiedades' => 'properties#index'
  get '/properties/delete/:id' => 'properties#my_delete'

  scope :admin do
    get '/' => 'admin#index'
  end

  scope :buscar do
    get '/' => 'search#index'
  end

  get '/tinder' => 'search#tinder'

  scope :auth do
    get '/google_oauth2/callback' => 'callbacks#google'
    get '/facebook/callback' => 'callbacks#facebook'
  end

end
