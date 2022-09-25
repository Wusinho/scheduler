# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :registrations
      resources :sessions
      resources :departments

    end
  end
end
