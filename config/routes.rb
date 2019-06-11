Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'

  get 'users/registration'
  get 'users/update'
  get 'users/sign_out'

  resources :users, only: :show
end
