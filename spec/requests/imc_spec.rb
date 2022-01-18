require 'rails_helper'

RSpec.describe "Imcs", type: :request do
  describe "POST /calcular_imc" do
    it "returnar o resultado do cálculo do imc" do
      post "/imc", params: { height: 1.70, weight: 76 }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        "imc" => 26.3,
        "classification" => "Sobrepeso",
        "obesity" => "I" 
    })
    end
  end

end
