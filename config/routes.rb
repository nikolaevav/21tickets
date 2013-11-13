Tickets::Application.routes.draw do

  resources :settings, only: [:edit, :update]
  root to: "home#index"
  devise_for :users, controllers: { registrations: "registrations" }
  # get "/:id", to: "home#else"
  post "/submit", to: "home#submit"

end
