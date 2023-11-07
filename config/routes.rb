Rails.application.routes.draw do
  resources :styles
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'breweries#index'

  resources :ratings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'

  resources :places, only: [:index, :show]
  post 'places', to: 'places#search'

  resources :breweries do
    post 'toggle_activity', on: :member
  end

  resources :users do
    post 'toggle_enabled', on: :member
  end

  resources :memberships do
    post 'confirm', on: :member
  end

  get 'beerlist', to: 'beers#list'
  get 'brewerylist', to: 'breweries#list'
end
