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

    it 'retonar um erro quando a altura estiver faltando' do
      post "/imc", params: { weight: 76 }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: height\nDid you mean?  weight\n               action\n               controller"
      })
    end

    it 'retonar um erro quando o peso estiver faltando' do
      post "/imc", params: { height: 1.70 }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: weight\nDid you mean?  height\n               action\n               controller"
      })
    end
  end

end
