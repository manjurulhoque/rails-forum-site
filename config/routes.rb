Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :posts

    root 'posts#index'

    get  '/signup',  to: 'users#new'
    resources :users

    get 'login', to: 'auth#new'
    post 'login', to: 'auth#create'
    delete 'logout', to: 'auth#destroy'

    resources :categories, except: [:destroy]
end
