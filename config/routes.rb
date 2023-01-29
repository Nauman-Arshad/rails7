Rails.application.routes.draw do
  devise_for :users
  root 'public#home'
  namespace :api do
    namespace :v1 do
      resources :books
    end
  end
end
