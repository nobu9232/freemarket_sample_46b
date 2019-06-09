Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
<<<<<<< HEAD
  get 'users/update'
=======
  get 'users' => 'users#edit'
  resources :users, action: :show
  
>>>>>>> origin/ユーザープロフィール編集ページ
end
