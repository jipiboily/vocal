Opinionated::Engine.routes.draw do

  namespace :admin do
    get '/' => 'app#app'
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
end