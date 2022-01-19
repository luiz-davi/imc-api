# IMC CALCULATOR
> Status: **Finalizado**✅<br>

## Objetivo ✅
A api visa fornecer informações a partir do cálculo de IMC.

## Autor 👦
+   [Luiz Davi](https://github.com/luiz-davi)

## Funcionamento 🖥

+ A api é protegida com token JWT. Como não há rota de login, antes de inicar o sistema, abra o terminal do rails usando o comando 'rails c' e crei um usuário.
> User.create(name: username, password: passwordTeste)

+ Para gerar o JWT apartir do seu cadastro, existe o endpoint: (POST) "api/v1/authenticate". <br>
Nele, deverá ser passado seu nome e senha no corpo do json.
> curl -X POST http://localhost:3000/api/v1/authenticate -H "Content-Type: application/json" -d '{ "name": user_name, "password": password }'

+ Dito isso, o endpoint que retorna as informações a partir do imc é: (POST) "/api/v1/imc".
Essa chamada deve conter um json especificando a altura e peso do indivíduo, respectivamente.<br>
Porém, para que seja possível ter acesso a api, é necessário estar authenticado no sistema, por isso, é necessário passar junto ao json da requisição o seu token de autenticação
> curl --header "Authorization: Bearer **token**" --header "Content-Type: application/json" --request POST --data '{ "height": altura, "weight": peso }' http://localhost:3000/api/v1/imc

## Ferramentas e versões 🛠

Ferramentas | Versões
----------- | ----------
Ruby        | 3.0.1
Rails       | 6.1.4.1
Git         | 2.25
JWT         | none
Rspec       | 3.10



