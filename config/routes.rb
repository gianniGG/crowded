Rails.application.routes.draw do

  root 'projects#home'

  devise_for :admins
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_for :companies, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :companies, except: [:destroy]

  resources :companies do
    resources :projects
    member do
      get 'dashboard'
    end
  end

  resources :users do
    member do
      get 'interests'
      get 'dashboard'
    end
  end

  resources :projects do
    collection do
      post 'search'
    end
    resources :donations
  end

  resources :users do
    resources :charges
  end

end

