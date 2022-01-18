Rails.application.routes.draw do
  post 'imc', to: "imc#calcular_imc"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
