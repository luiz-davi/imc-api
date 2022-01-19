module Api
  module V1
    class ImcController < ApplicationController

      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def calcular_imc
        height =  params.require(:height).to_f
        weight = params.require(:weight).to_f

        result = ImcCalculatorService.calcular_imc(height, weight)

        render json: result, status: :created

      end

      private

      def parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end
