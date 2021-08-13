Rails.application.routes.draw do
  resources :cart_items
  resources :carts
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get '/users/sign_out', to: 'users/sessions#destroy'
    root "users/sessions#new"
  end
  resources :items
  resources :shops
  # root to: "shops#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
