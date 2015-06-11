require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, path: "/" do
    namespace :v1 do
      resources :items
      # resources :items
    end
  end
end