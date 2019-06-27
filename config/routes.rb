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
    collection do
      get 'registration'
      get 'signup'
      get 'profile'
      get 'card'
      get 'sign_out'
      get 'identification'
    end
  end
end

