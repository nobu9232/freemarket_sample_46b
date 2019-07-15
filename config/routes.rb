Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  
  root 'products#index'
  resources :products do
    member do
      get 'show_sell'
      get 'confirmation'
      get 'buy'
      post 'pay'

    end
  end

  resources :users do
    member do
      get 'card_form'
    end
    collection do
      post 'card_create'
      get 'signup'
      get 'profile'
      get 'card'
      get 'sign_out'
      get 'identification'
    end
  end
  
end