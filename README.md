<h1>SISTEMA DE ENTREGAS - TREINADEV TURMA: 08<h1>
Sobre o projeto:

<h2>Aplicação tem como objetivo gerenciar meios de transporte disponíveis para e-commerces.</h2>

- Cadastrar transportadoras, seus veículos, tabelas de preço e prazos;
- Criar ordens de serviço, pesquisar preços e prazos praticados pelas
  transportadoras conforme ordem e vincular a uma transportadora;
- Aceitar ordens de serviço atribuídas à transportadora e atualizar periodicamente situação da entrega;
- Consultar qual status da entrega realizada.<br>
  Obs:

* O Admin pode acessar a aplicação com o login: "admin@sistemasdefrete.com.br" senha: "123456".

Configuração base do projeto:

- Rails 7.0.3
- Ruby 3.0.3

Configuração de testes:

- Rspec-rails 5.1.2
- gem "capybara"

Como iniciar o projeto:

1. Clone o projeto para sua máquina <br>
   git@github.com:Vanessamachado93/sistema_de_entregas.git,<br>
2. Mude para a pasta principal do repositório, no terminal cd sistema_de_entregas, e dentro da pasta do projeto, rode o comando bin/setup em seu terminal, esse comando vai instalar as dependencias necessárias para rodar o projeto em sua máquina.
3. Rode o arquivo seed com o comando rails db:seed.
4. Você pode utilizar o comando rails s para ver a aplicação funcionando localmente no endereço http://localhost:3000.

Como executar os testes:

1.  Execute o comando `rspec` no terminal.

<h2> Organização do projeto.</h2>

- [Github projects](https://github.com/users/Vanessamachado93/projects/2)
