module Api
  module V1
    class ImcController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :authenticate_user, only: [:calcular_imc]

      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def calcular_imc
        height =  params.require(:height).to_f
        weight = params.require(:weight).to_f

        result = ImcCalculatorService.calcular_imc(height, weight)

        render json: result, status: :created

      end

      private

      def authenticate_user
        #Authorization: Bearer <token>
        token, _options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)

        User.find(user_id)
      rescue ActiveRecord::RecordNotFound, JWT::DecodeError
        render status: :unauthorized
      end

      def parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end
