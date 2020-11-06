Rails.application.routes.draw do

  resources :posts do
    resources :likes
    resources :comments
  end

  resources :daily_journals do 
    resources :workouts do 
      resources :exercises
    end
    resources :meals do
      resources :food_items
    end
  end

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}

  # get '/auth/:provider/callback' => 'sessions#omniauth' 
  # get 'auth/failure', to: redirect('/')
  resources :users, :goals


  
  root to: "application#home"
end
