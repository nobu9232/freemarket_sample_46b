Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations',sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'products#index'
  resources :products do
    collection do
      get 'show_sell'
      get 'sell'
      get 'confirmation'
    end
  end

  resources :users do
    collection do
      get 'address'
      get 'registration'
      get 'signup'
      get 'profile'
      get 'card'
      get 'sign_out'
      get 'identification'
    end
  end
  
end