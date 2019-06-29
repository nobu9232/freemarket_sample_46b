Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'products#index'
  resources :products do
    collection do
      get 'sell'
      get 'confirmation'
    end
  end

  resources :users do
    member do
      get 'profile'
      get 'identification'
    end
    collection do
      get 'registration'
      get 'signup'
      get 'card'
      get 'sign_out'
    end
  end
end

