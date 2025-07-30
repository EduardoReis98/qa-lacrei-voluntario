Feature: Recuperação de senha

  Scenario: Solicitar recuperação com e-mail válido
    Given que estou na tela de login
    When clico em "Esqueci minha senha"
    And informo meu e-mail válido
    Then devo ver a mensagem "Instruções enviadas para seu e-mail"

  Scenario: Solicitar com e-mail inválido
    Given que estou na tela de recuperação de senha
    When informo um e-mail inválido
    Then devo ver a mensagem "E-mail inválido"