Statustar::Application.routes.draw do

  get "static/index"

  get "sessions/new"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :statuses
  resources :sessions,      :only => [:new, :create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/terms',   :to => 'pages#terms'
  match '/faq',     :to => 'pages#faq'
  match '/privacy', :to => 'pages#privacy'

  root :to => 'pages#home'
  #root :to => 'static#index'

  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
  get "pages/terms"
  get "pages/faq"
  get "pages/privacy"
end
