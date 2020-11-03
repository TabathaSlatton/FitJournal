Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}

  # get '/auth/:provider/callback' => 'sessions#omniauth' 
  # get 'auth/failure', to: redirect('/')
  
  
  root to: "application#home"
end
