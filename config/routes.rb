Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, 
      path: '', 
      path_names: {
        sign_in: 'users/login',
        sign_out: 'users/logout',
        registration: 'users/sign_up'
      },
      controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
      resources :users
      resources :profiles
      resources :tutorials
      # resource :users, only: [:show, :update, :destroy]
    end
  end
end
  
  
