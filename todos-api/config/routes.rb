Rails.application.routes.draw do
  namespace :api, path: "/" do
    namespace :v1 do
      # resources :items, constraints: { subdomain: 'api'}
      resources :items
    end
  end
end