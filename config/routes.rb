Rails.application.routes.draw do

  resources :posts do
    resources :likes, :comments
  end

  resources :daily_journals do 
    resources :workouts, :meals
  end

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}

  # get '/auth/:provider/callback' => 'sessions#omniauth' 
  # get 'auth/failure', to: redirect('/')
  resources :goals


  
  root to: "application#home"
end
