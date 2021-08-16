Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get '/users/sign_out', to: 'users/sessions#destroy'
    root "users/sessions#new"
  end
  resources :wallets, only: %i[ create show destroy ]
  resources :shops, except: %i[ new show ]
  resources :carts, only: %i[ create destroy ] do
    get 'add_item', on: :member
    get 'buy_item', on: :member
  end
  resources :cart_items, only: %i[ create update destroy]
  resources :items, except: %i[ new show ]
end
