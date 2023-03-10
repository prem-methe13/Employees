Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"

  post "/auth/login", to: "authentication#login"
  get "users/:id/manager", to: "users#show_employees"
  resources :users
  resources :managers
  resources :employees
end
