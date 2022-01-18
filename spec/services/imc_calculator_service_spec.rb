require 'rails_helper'

describe ImcCalculatorService do
    describe 'imc' do
        it 'calcular imc' do
            imc = described_class.calcular_imc(1.70,76)
            expect(imc).to eq({
                "imc": 26.3,
                "classification": "Sobrepeso",
                "obesity": "I" 
            })
        end
    end
end