Feature: Cadastro de novo paciente

  Scenario: Realizar cadastro com sucesso
    Given que estou na página de cadastro
    When preencho todos os campos obrigatórios corretamente
    And aceito os termos de uso e que tenho 18 anos
    And clico em cadastrar
    Then devo ser redirecionado a página de confirmação de email
    And sou redirecionado para página de login e tento efetuar o mesmo