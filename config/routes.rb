Rails.application.routes.draw do
  resources :jobs do
    member do
      post :generate_cover_letter
    end

    collection do
      post :generate_cover_letter_from_data
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end