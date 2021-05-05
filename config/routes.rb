Rails.application.routes.draw do
  root to: "items#index"

  resources :items, omly: :index
end
