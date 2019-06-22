Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  resources :tops, except: :index, action: :sell
  get 'users/update'
  get 'users/sign_out'
<<<<<<< HEAD
  resources :products, action: :confirmation
=======
  get 'products/confirmation'
>>>>>>> origin/商品購入確認ページ作成
  resources :users, only: :show
end

