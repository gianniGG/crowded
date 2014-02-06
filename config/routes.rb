Rails.application.routes.draw do

  root 'projects#home'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :users do
    member do
      get 'interests'
      get 'dashboard'
    end
  end

  resources :projects do
    member do
      get 'home'
    end
  end

  resources :charges

  end
