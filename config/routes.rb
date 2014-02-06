Rails.application.routes.draw do

  root 'projects#index'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :users do
    member do
      get 'interests'
      get 'dashboard'
    end
  end

  resources :projects

  resources :charges

  end
