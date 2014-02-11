Rails.application.routes.draw do

  root 'projects#home'

  devise_for :admins
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_for :companies, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :companies, except: [:destroy]

  resources :companies do
    resources :projects
  end

  resources :users do
    member do
      get 'interests'
      get 'dashboard'
    end
  end

  resources :projects do
    resources :charges
  end
  resources :member do
      get 'home'
  end

  resources :charges
end
