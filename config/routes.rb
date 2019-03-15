# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#index"
  get 'static_pages/index'
  get 'static_pages/about'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :microposts,   only: [:create, :destroy]
end
