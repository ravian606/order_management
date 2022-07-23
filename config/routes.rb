Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  #devise_for :users,  path: 'users'  # http://localhost:3000/users/sign_in
  #devise_for :admins, path: 'admins' # http://localhost:3000/admins/sign_in

  resources :companies do 
    resources :sites do
      resources :contacts
    end
  end
  resources :products do 
  end
  resources :orders do
    collection do
      get 'show_recurring_orders'
      get 'show_completed_orders'
    end
    member do
      patch 'mark_complete'
    end
  end
  get '/contacts', to: 'contacts#all_contacts'
  get '/sites', to: 'sites#all_sites'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
