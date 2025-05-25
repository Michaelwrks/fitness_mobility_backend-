# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # respond_to :json

  skip_before_action :verify_signed_out_user, only: :destroy


  def create

    email = params[:email]
    password = params[:password]

    # Log the email to verify it's being received
    Rails.logger.info "Attempting login for email: #{email}"


    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      sign_in(user)
      render json: { message: "Logged in successfully", user: user.as_json(only: [:id, :email]) }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    if current_user
      current_user.update(authentication_token: nil)
      render json: { message: "Logged out successfully" }, status: :ok
    else
      render json: { error: "No active session" }, status: :unauthorized
    end
  end
end
