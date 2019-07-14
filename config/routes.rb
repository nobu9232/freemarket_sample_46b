Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'},controllers: {sessions: 'users/sessions'}
  
  root 'products#index'
  resources :products do
    collection do
      get 'show_sell'
      get 'confirmation'
      get 'buy'
    end
  end

  resources :users do
    collection do
      get 'card_form'
      post 'card_create'
      post 'pay'
      get 'signup'
      get 'profile'
      get 'card'
      get 'sign_out'
      get 'identification'
    end
  end
  
end