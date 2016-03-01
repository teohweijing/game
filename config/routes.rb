Rails.application.routes.draw do
  resources :banks
  resources :promotions
  devise_for :users

  scope "/admin" do
  	resources :users
  	# resources :users do
    # 	resources :accounts
  	# end
  end

  resources :users do
     resources :accounts
  end

  resources :requests
  resources :applications
  resources :roles
  resources :welcome
  resources :dashboard

  authenticated :user do
    root to: "welcome#show", as: :authenticated_root
  end
  root to: "welcome#index"
end
