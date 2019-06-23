Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  get 'users/signup'
  resources :users, action: :registration
  resources :tops, except: :index, action: :sell
  get 'users/update'
  get 'users/sign_out'
<<<<<<< HEAD
  resources :users, action: :login
end

=======
  resources :products, action: :confirmation
  get 'users/card'
  resources :users, only: :show
  get 'users/identification'
end
>>>>>>> master
