# IMC CALCULATOR
> Status: **Em desenvolvimento**⚠️<br>

## Objetivo ✅
A api visa fornecer informações sobre a partir do cálculo de IMC.

## Integrantes 👦
+   [Luiz Davi](https://github.com/luiz-davi)

## Funcionamento 🖥

A api é projetida com token JWT. Como não há rota de login, antes de inicar o sistema, abra o terminal do rails usando o comando 'rails c' e crei um usuário.
+ Ex.: User.create(name: username, password: passwordTeste)

Dito isso, o endpoint que retorna a informações é: (POST) "/imc".
Essa chamada deve conter um json especificando a altura e peso do indivíduo, respectivamente.<br>
Porém, para que seja possível ter acesso a api, é necessário estar authenticado no sistema, por isso, é necessário passar junto ao json da requisição seu nome e senha, para que seja feita a checagem.

+ Exemplo de chama usando o CURL: curl -X POST http://localhost:3000/api/v1/imc -H "Content-Type: application/json" -d '{ "height": altura, "weight": peso }'

## Ferramentas e versões 🛠

Ferramentas | Versões
----------- | ----------
Ruby        | 3.0.1
Rails       | 6.1.4.1
Git         | 2.25
JWT         | none
Rspec       | 3.10



