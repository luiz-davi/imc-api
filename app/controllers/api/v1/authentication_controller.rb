module Api
    module V1
        class AuthenticationController < ApplicationController
            rescue_from ActionController::ParameterMissing, with: :parameter_missing

            def create
                p params.require(:password).inspect

                user = User.find_by(name: params.require(:name))
                token = AuthenticationTokenService.get_jwt(user.id)

                render json: { token: token }, status: :created
            end

            private

            def parameter_missing(erro)
                render json: { error: erro.message }, status: :unprocessable_entity
            end
        end
    end
end