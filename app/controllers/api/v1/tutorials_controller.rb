class Api::V1::TutorialsController < ApplicationController
    before_action :set_tutorial, only: [:show]

    def index
      @tutorials = Tutorial.all
      render json: TutorialSerializer.new(@tutorials).serializable_hash.to_json
    end

    def show
      render json: TutorialSerializer.new(@tutorial).serializable_hash.to_json
    end

      private
  
      def set_tutorial
        @tutorial = Tutorial.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {error: 'Tutorial not found'}, status: :not_found
      end
  
      def tutorial_params
        params.require(:tutorial).permit(:name, :category, :format, :profile_id)
      end
end
