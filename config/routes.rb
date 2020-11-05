Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :posts
  resources :goals
  resources :exercises
  resources :workouts
  resources :food_items
  resources :meals
  resources :daily_journals
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}

  # get '/auth/:provider/callback' => 'sessions#omniauth' 
  # get 'auth/failure', to: redirect('/')
  resources :users
  
  root to: "application#home"
end
