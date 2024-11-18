Rails.application.routes.draw do
  devise_for :admin, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions",
    passwords: "admin/passwords",
    confirmations: "admin/confirmations"
  }
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "home#top"
  resources :shifts, only: [:new, :create, :show, :index, :edit, :update, :destroy] do
    resources :tickets, only: [:create, :destroy]
  end
end
