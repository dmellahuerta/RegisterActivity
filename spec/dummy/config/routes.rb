# frozen_string_literal: true

Dummy::Application.routes.draw do
  namespace :dummy do
    resources :users, only: %i[update delete]
  end
end
