Feature: Edição do perfil do usuário

  Scenario: Alterar nome com sucesso
    Given que estou logado na plataforma
    And estou na área de perfil
    When altero meu nome
    And clico em "Salvar alterações"
    Then devo ver a mensagem "Perfil atualizado com sucesso"

  Scenario: Tentar salvar com campos obrigatórios vazios
    Given que estou logado e na área de perfil
    When apago todos os campos obrigatórios
    And clico em "Salvar"
    Then devo ver uma mensagem de erro