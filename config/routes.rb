Rails.application.routes.draw do
  resources :users, :answers, :questions, only: [ :index, :new, :create ]
  get '/auth/developer/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
end
