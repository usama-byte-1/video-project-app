Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create]
  root "projects#index"
end
