Feature: Cadastro de novo usuário

  Scenario: Cadastro com dados válidos
    Given que estou na página de cadastro
    When preencho todos os campos obrigatórios corretamente
    And clico no botão "Cadastrar"
    Then devo ver a mensagem "Cadastro realizado com sucesso"

  Scenario: Cadastro com e-mail inválido
    Given que estou na página de cadastro
    When informo um e-mail inválido
    And preencho os demais campos corretamente
    And clico em "Cadastrar"
    Then devo ver uma mensagem de erro referente ao e-mail