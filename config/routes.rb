Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'home#index'

  namespace :api do
    get '/', to: 'home#index'
    get 'login/google', to: redirect('/auth/google_oauth2')
    get 'login/facebook', to: redirect('/auth/facebook')
    get 'login/twitter', to: redirect('/auth/twitter')

    get 'logout', to: 'sessions#destroy'
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')

    resources :quotes do
      get :qotd, on: :collection
      get :personal_quotes, on: :collection
    end

    resources :users, only: :show do
      get :quotes, on: :member

      resources :bookmarks
    end

    resources :tags
  end

  get '*all', to: 'not_found#index'
end
