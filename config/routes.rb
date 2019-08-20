Rails.application.routes.draw do
  get 'basket_items/index'
  get 'basket_items/new'
  get 'basket_items/create'
  get 'basket_items/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :categories
  resources :products do
    resources :product_variants, only: [:new, :create, :edit, :update]
  end
  resources :product_variants, only: [:index, :show, :destroy] do
    resources :basket_items, only: [:create]
  end
  get '/basket', to: 'baskets#show'
  resources :basket_items, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
