Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      resources :users
      resources :profiles
      resources :tutorials
    end
  end

end
