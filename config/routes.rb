Rails.application.routes.draw do
  resources :users, :answers, :questions, only: [ :index, :new, :create, :show, :update, :edit, :destroy ]

  resources :questions do
    resources :answers
  end
end
