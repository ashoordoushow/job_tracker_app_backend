Rails.application.routes.draw do
  resources :jobs do
    member do
      post :generate_cover_letter
    end
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end