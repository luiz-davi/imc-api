class ImcCalculatorService
    def self.calcular_imc(heigth, weigth)
        imc = weigth
        imc /= heigth*heigth
        imc = imc.ceil(1)

        if imc < 18.5
            classification = "Magreza"
            obesity = "0"
        elsif imc >= 18.5 && imc < 25
            classification = "Normal"
            obesity = "0"
        elsif imc >= 25 && imc < 30
            classification = "Sobrepeso"
            obesity = "I"
        elsif imc >= 30 && imc < 40
            classification = "Obesidade"
            obesity = "II"
        elsif imc >= 40
            classification = "Obesidade grave"
            obesity = "III"
        end

        {
            "imc": imc,
            "classification": classification,
            "obesity": obesity
        }
        
    end
end