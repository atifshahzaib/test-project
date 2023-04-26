Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'products#index'

  get '/user' => 'products#index', :as => :user_root

  resources :cart_items
  resources :checkouts, only: [:create]
  resources :shipments, only: %i[show update]
  resources :orders, only: %i[index show]
  resources :products do
    collection do
      get 'mine'
    end
  end

  # delete '/cart_items/:id', to: 'cart_items#destroy', as: 'cart_item'

end
