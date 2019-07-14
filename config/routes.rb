Rails.application.routes.draw do
  devise_for :users
  
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
    collection do
      get 'card_form'
      post 'card_create'
      get 'signup'
      get 'profile'
      get 'card'
      get 'sign_out'
      get 'identification'
    end
  end
  
end