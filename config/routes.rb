Rails.application.routes.draw do
  resources :users, :answers, :questions, only: [:index, :new, :create]
end
