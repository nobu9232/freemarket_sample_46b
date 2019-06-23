Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
<<<<<<< HEAD
  get 'tops/show'
=======
  resources :tops, except: :index, action: :sell
>>>>>>> master
  get 'users/update'
  get 'users/sign_out'
  resources :products, action: :confirmation
  get 'users/card'
  resources :users, only: :show
  get 'users/identification'
end