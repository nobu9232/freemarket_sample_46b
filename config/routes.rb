Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users, controllers: {registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  get 'users/signup'
  get 'users/registration'
  get 'users/login'
  get 'users/identification'
  resources :tops, except: :index, action: :sell
  get 'users/update'
  get 'users/sign_out'
  resources :products, action: :confirmation
  get 'users/card'
=======
  devise_for :users
  
  root 'products#index'
  resources :products do
    collection do
      get 'sell'
      get 'confirmation'
    end
  end

  resources :users do
    collection do
      get 'registration'
      get 'signup'
      get 'profile'
      get 'card'
      get 'sign_out'
      get 'identification'
    end
  end
  
>>>>>>> master
end

