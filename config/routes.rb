Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'imc', to: "imc#calcular_imc"
      post 'authenticate', to: "authentication#create"
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
