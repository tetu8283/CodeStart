Rails.application.routes.draw do
  # ルートをログインページに設定(deviseはadminなどの管理者用もサポートしているため、userを指定)
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end





  root to: "questions#top"
  devise_for :users

  resources :questions, only: [ :new, :create, :index, :edit, :update, :show, :destroy ]



  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
