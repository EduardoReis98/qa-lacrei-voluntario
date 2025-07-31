# language: pt
Funcionalidade: Cadastro de novo usuário na versão mobile

  Como uma pessoa usuária
  Quero me cadastrar com meus dados pessoais
  Para ter acesso aos serviços da plataforma

  Contexto:
    Dado que estou na página de cadastro

  Cenário: Layout da versão mobile desconfigurado
    Quando acesso a página no tamanho de tela 375x667
    Então o layout deve ser responsivo
    E os textos não devem ficar sobrepostos
    E os campos e botões devem ser acessíveis para toque

  Cenário: Cadastro preenchido corretamente, mas sem recebimento do e-mail de verificação
    Quando preencho todos os campos obrigatórios com dados válidos:
      | Campo             | Valor                           |
      | Nome social       | Eduardo                         |
      | Sobrenome         | Reis Rodrigues                  |
      | Email             | eduardo.reis1509@gmail.com      |
      | Confirmar Email   | eduardo.reis1509@gmail.com      |
      | Senha             | Batata42*                       |
      | Confirmar Senha   | Batata42*                       |
    E aceito os termos de uso
    E confirmo que tenho 18 anos ou mais
    E clico no botão "Cadastrar"
    Então devo ver a mensagem "Estamos quase lá ..."
    E uma mensagem informando que um link foi enviado por e-mail

  Cenário: Reenvio do e-mail de verificação falha
    Dado que finalizei o cadastro e vejo a mensagem "Estamos quase lá ..."
    Quando clico na opção "Reenviar e-mail de verificação"
    Então o sistema deve exibir a confirmação de reenvio
    Mas o e-mail não é recebido (inclusive na caixa de spam)
    Então devo ver uma opção visível de contato com o suporte
    E mensagens claras indicando alternativas para continuar