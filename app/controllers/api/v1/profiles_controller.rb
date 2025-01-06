class Api::V1::ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :update, :destroy]

    def index
      @profiles = Profile.all
      render json: @profiles
    end

    def show
      render json: @profile
    end

    def create
        @profile = Profile.new(profile_params)
  
        if @profile.save
          render json: @profile, status: :created
        else
          render json: @profile.errors, status: :unprocessable_entity
        end
      end
  
      def update
        if @profile.update(profile_params)
          render json: @profile
        else
          render json: @profile.errors, status: :unprocessable_entity
        end
      end
  
      def destroy
        @profile.destroy
        head :no_content
      end
  
      private
  
      def set_profile
        @profile = Profile.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {error: 'profile not found'}, status: :not_found
      end
  
      def profile_params
        params.require(:profile).permit(:mobility_level, :goals)
      end

end
