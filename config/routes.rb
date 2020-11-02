Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations' }

  get '/auth/:provider/callback' => 'sessions#omniauth' 
  get 'auth/failure', to: redirect('/')
  root to: "users#show"
end
