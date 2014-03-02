Opinionated::Engine.routes.draw do

  namespace :admin do
    get '/' => 'app#app'
    resources :posts
  end

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create', as: 'users'

  get 'logout', to: 'sessions#destroy', as: 'logout'
end
