Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "home#top"
  resources :shifts, only: [:new, :create, :show, :index, :destroy]
end
