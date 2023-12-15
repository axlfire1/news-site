Rails.application.routes.draw do
  resources :news_walls
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"
  resources :sections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check  

  # custom active admin admin
  delete '/admin/sections/:id/delete_element', to: 'admin/sections#delete_element', as: :delete_element
  delete '/admin/news_walls/:id/delete_element', to: 'admin/news_walls#delete_news_wall_element', as: :delete_news_wall_element
end
