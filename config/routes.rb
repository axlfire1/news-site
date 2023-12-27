Rails.application.routes.draw do
  get '/new_details/:id', to: 'new_details#show', as: 'new_details'
  resources :announcements
  resources :news_walls
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"
  resources :sections

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check  

  # custom active admin admin
  delete '/admin/sections/:id/delete_element', to: 'admin/sections#delete_element', as: :delete_element
  delete '/admin/articles/:id/delete_element', to: 'admin/articles#delete_article_element', as: :delete_article_element
  delete '/admin/news_walls/:id/delete_element', to: 'admin/news_walls#delete_news_wall_element', as: :delete_news_wall_element
  delete '/admin/announcements/:id/delete_element', to: 'admin/announcements#delete_announcement_element', as: :delete_announcement_element
end
