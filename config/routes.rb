Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do 
      resources :users
      resources :profiles
      resources :tutorials
    
    # resource :users, only: [:show, :update, :destroy]
    end
  end
end
  
  
