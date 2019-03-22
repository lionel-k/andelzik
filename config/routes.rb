# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'homes#index'

  resources :albums, only: [:index, :show, :create, :update, :destroy]
  resources :purchases, only: [:create]
  get '/search/', to: 'products#search', as: 'search'
end
