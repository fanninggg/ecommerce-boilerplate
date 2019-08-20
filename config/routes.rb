Rails.application.routes.draw do
  namespace :admin do
    get 'product_variants/new'
    get 'product_variants/edit'
  end
  devise_for :users
  root to: 'pages#home'
  namespace :admin do
    resources :categories
    resources :products do
      resources :product_variants, only: [:new, :create, :edit, :update]
    end
    resources :product_variants, only: [:index, :show, :destroy]
  end
  resources :product_variants, only: [:index, :show] do
    resources :basket_items, only: [:create]
  end
  get '/basket', to: 'baskets#show'
  resources :orders, only: [:create, :show]
  resources :basket_items, only: [:index, :destroy]
  resources :addresses, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
