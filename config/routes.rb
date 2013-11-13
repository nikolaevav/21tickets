Tickets::Application.routes.draw do

  root to: "home#index"
  devise_for :users, controllers: { registrations: "registrations" }
  get "/:id", to: "home#else"
  post "/submit", to: "home#submit"

end
