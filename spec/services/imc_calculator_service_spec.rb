require 'rails_helper'

describe ImcCalculatorService do
    describe 'imc' do
        it 'calcular imc' do
            imc = described_class.calcular_imc(1.80,80)
            expect(imc).to eq(24.6)
        end
    end
end