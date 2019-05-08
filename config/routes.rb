Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
      root to: "dashboards#show"
  end
  root to: "homes#show"
  resources :songs, only: [:create, :show] do
    member do
      post "like", to: "likes#create"
      delete "unlike", to: "likes#destroy"
    end
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in", to: "sessions#new", as: "sign_in"
  delete "/sign_out", to:  "sessions#destroy", as: "sign_out"
  get "/sign_up", to: "users#new", as: "sign_up"
end
