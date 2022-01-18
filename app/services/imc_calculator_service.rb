class ImcCalculatorService
    def self.calcular_imc(heigth, weigth)
        imc = (weigth / (heigth*heigth)).floor(1)
        classification = ""
        obesity = ""

        if imc < 16.5
            classification = "Peso severamente abaixo do normal"
        elsif imc >= 16.5 && imc < 18.5
            classification = "Peso abaixo do normal"
        elsif imc >= 18.5 && imc < 25
            classification = "Normal"


    end
end