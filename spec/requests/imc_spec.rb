require 'rails_helper'

RSpec.describe "Imcs", type: :request do
  describe "POST /calcular_imc" do

    let!(:user)  { FactoryBot.create(:user, name: "luiz davi", password: "123") }

    it "returnar o resultado do cálculo do imc" do
      post "/api/v1/imc", params: { height: 1.70, weight: 76 }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w" }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        "imc" => 26.3,
        "classification" => "Sobrepeso",
        "obesity" => "I" 
    })
    end

    it 'retonar um erro quando a altura estiver faltando' do
      post "/api/v1/imc", params: { weight: 76 }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w" }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: height\nDid you mean?  weight\n               action\n               controller"
      })
    end

    it 'retonar um erro quando o peso estiver faltando' do
      post "/api/v1/imc", params: { height: 1.70 }, headers: { "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w" }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: weight\nDid you mean?  height\n               action\n               controller"
      })
    end

    context 'jwt faltando' do
      it 'retornar um erro 401' do
        post "/api/v1/imc", params: { height: 1.70, weight: 76 }, headers: {}

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

end
