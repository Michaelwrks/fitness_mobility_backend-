class ApplicationController < ActionController::API
    
    acts_as_token_authentication_handler_for User, fallback: :none
    
    before_action :authenticate_user, except: [:create, :index]


    def current_user
      User.find_by(authentication_token: request.headers['X-User-Token'])
    end

    private
  
    def authenticate_user
      unless current_user
        render json: { error: 'Not Authorized' }, status: :unauthorized
      end
    end
end

   