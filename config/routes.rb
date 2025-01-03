Rails.application.routes.draw do
  devise_for :admin, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions",
    passwords: "admin/passwords",
    confirmations: "admin/confirmations"
  }
  devise_for :users

  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admin/sessions#guest_sign_in'
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root "home#top"

  resources :shifts, only: [:new, :create, :show, :index, :edit, :update, :destroy] do
    resources :tickets, only: [:create, :destroy, :show, :index] do
      member do
        patch :approve
        patch :reject
      end
    end
  end

  resources :tickets, only: [:index]

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
