class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
      render json: UserSerializer.new(@users, include: [:profile]).serializable_hash.to_json
    end

    def show
      if @user
        render json: UserSerializer.new(@user, include: [:profile]).serializable_hash.to_json
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
  

    def create
        @user = User.new(user_params)
  
        if @user.save
          render json: UserSerializer.new(@user, include: [:profile]).serializable_hash.to_json, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
        
  
      def update
        if @user.update(user_params)
          render json: UserSerializer.new(@user, include: [:profile]).serializable_hash.to_json, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
  
      def destroy
        @user.destroy
        head :no_content
      end
  
      private
  
      def set_user
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {error: 'user not found'}, status: :not_found
      end
  
      def user_params
        params.require(:user).permit(:name, :email, :age, :password)
      end

end
