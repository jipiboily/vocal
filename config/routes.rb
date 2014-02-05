Opinionated::Engine.routes.draw do

  namespace :admin do
    get '/' => 'app#app'
  end

  get 'login', to: 'sessions#new', as: 'login'
end