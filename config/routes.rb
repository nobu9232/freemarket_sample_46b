Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
<<<<<<< HEAD
  get 'users/show'
=======
  get 'users/update'
  get 'users/sign_out'

  resources :users, only: :show
>>>>>>> master
end
