# language: pt
Funcionalidade: Cadastro de novo usuário

  Como uma pessoa usuária
  Quero me cadastrar com meus dados pessoais
  Para ter acesso aos serviços da plataforma

  Contexto:
    Dado que estou na página de cadastro

  Cenário: Realização de cadastro com sucesso, apesar de dificuldades visuais
    Quando visualizo o formulário na versão mobile
    Então o layout deve se ajustar corretamente ao tamanho da tela
    E os campos e botões devem ser acessíveis e legíveis

    Quando preencho os seguintes campos corretamente:
      | Campo             | Valor                           |
      | Nome social       | Eduardo                         |
      | Sobrenome         | Reis Rodrigues                  |
      | Email             | eduardo.reis1509@gmail.com      |
      | Confirmar Email   | eduardo.reis1509@gmail.com      |
      | Senha             | Batata42*                       |
      | Confirmar Senha   | Batata42*                       |

    E aceito os termos de uso
    E confirmo que tenho 18 anos ou mais
    E clico no botão de "Cadastrar"

    Então devo visualizar a mensagem "Estamos quase lá ..."
    E uma mensagem indicando que receberei um link de confirmação por e-mail

  Cenário: Não recebimento do e-mail de verificação mesmo após reenviar
  Dado que completei meu cadastro com sucesso
  E visualizei a mensagem "Estamos quase lá ..."
  Quando clico na opção de reenviar o e-mail de verificação
  Então o sistema deve exibir uma confirmação de que o e-mail foi reenviado
  Mas não recebo o e-mail em minha caixa de entrada ou spam
  Então devo ter acesso fácil a uma opção de contato com o suporte
  E a interface deve informar alternativas claras para resolver o problema