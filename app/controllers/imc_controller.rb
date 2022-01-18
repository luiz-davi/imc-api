class ImcController < ApplicationController
  def calcular_imc
    height =  params.require(:height).to_f
    weight = params.require(:weight).to_f

    result = ImcCalculatorService.calcular_imc(height, weight)

    render json: result, status: :created

  end
end
