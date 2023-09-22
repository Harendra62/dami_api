Rails.application.routes.draw do
resources :articles
resources :users, only: [:create]
end
