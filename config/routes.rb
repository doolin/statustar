Statustar::Application.routes.draw do

  get "static/index"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :statuses
  resources :sessions,      :only => [:new, :create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  
  get '/signup',  :to => 'users#new'
  get '/signin',  :to => 'sessions#new'
  delete '/signout', :to => 'sessions#destroy'

  get '/contact', :to => 'pages#contact'
  get '/about',   :to => 'pages#about'
  get '/help',    :to => 'pages#help'
  get '/terms',   :to => 'pages#terms'
  get '/faq',     :to => 'pages#faq'
  get '/privacy', :to => 'pages#privacy'

  root :to => 'pages#home'

  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
  get "pages/terms"
  get "pages/faq"
  get "pages/privacy"
end
