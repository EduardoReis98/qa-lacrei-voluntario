Feature: Busca de profissionais de saúde

  Scenario: Busca por palavra-chave
    Given que estou na página inicial
    When digito "psicólogo" no campo de busca
    And clico no botão de buscar
    Then devo ver uma lista de profissionais com essa especialidade

  Scenario: Busca sem resultados
    Given que estou na página inicial
    When digito "especialidade inexistente"
    And clico em buscar
    Then devo ver a mensagem "Nenhum resultado encontrado"