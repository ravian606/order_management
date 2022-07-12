Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  #devise_for :users,  path: 'users'  # http://localhost:3000/users/sign_in
  #devise_for :admins, path: 'admins' # http://localhost:3000/admins/sign_in

  resources :companies do 
    resources :sites
  end
  resources :products do 
    resources :orders
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
