# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#home"
  get 'static_pages/home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :microposts,   only: [:new, :create, :destroy]
end
