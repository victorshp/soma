Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :surveys, only: [:new, :create, :update, :index, :show] do
    resources :survey_answers, only: [:index, :new, :create]
    resources :questions, only: [:new, :create, :index, :show, :edit]
  end

  resources :questions, only: [] do
    resources :answers, only: [:new, :create]
  end

  get 'profile', to: 'profiles#show'
  get 'dashboard', to: 'dashboards#show'
end
