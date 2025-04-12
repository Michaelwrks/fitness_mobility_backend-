class Api::V1::ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :update, :destroy]

    def index
      @profiles = Profile.all
      render json: ProfileSerializer.new(@profiles, include: [:tutorials]).serializable_hash.to_json
    end

    def show
      render json: ProfileSerializer.new(@profile, include: [:tutorials]).serializable_hash.to_json
    end

    def create
        @profile = Profile.new(profile_params)
  
        if @profile.save
          render json: ProfileSerializer.new(@profile, include: [:tutorials]).serializable_hash.to_json
        else
          render json: @profile.errors, status: :unprocessable_entity
        end
      end
  
      def update
        if @profile.update(profile_params)
          render json: ProfileSerializer.new(@profile, include: [:tutorials]).serializable_hash.to_json
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
        @profile = Profile.includes(:tutorial).find_by(id: params[:id])
        render json: {error: 'profile not found'}, status: :not_found unless @profile
      end
  
      def profile_params
        params.require(:profile).permit(:mobility_level, :goals, :user_id, tutorials_ids: [])
      end

end
