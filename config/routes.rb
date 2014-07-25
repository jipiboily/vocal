Vocal::Engine.routes.draw do
  # reserved_words = ['l', 'pages', 'tags', 'categories','admin','css', 'js', 'assets', 'images']

  namespace :admin do
    get '/' => 'app#app'
    resources :posts
  end

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create', as: 'users'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'feed', to: 'feeds#index', as: 'feed'

  root to: 'posts#index'
  get '*post_url', to: 'posts#show', as: 'post'
end
