Rails
  .application
  .routes
  .draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :posts do
      resources :comments
    end

    get 'show_comments', to: 'comments#show'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'

    get 'logout', to: 'sessions#destroy'
    delete 'logout', to: 'sessions#destroy'

    get 'signup', to: 'users#new'
    post 'signup', to: 'users#create'

    get 'search', to: 'posts#search'
    get ':username', to: 'users#show', as: :username

    root to: 'users#new'
  end
