# language: pt
Funcionalidade: Layout responsivo na tela de cadastro

  Contexto:
    Dado que estou utilizando um dispositivo móvel

  Cenário: Elementos visuais desalinhados na interface de cadastro
    Quando acesso a página de cadastro
    Então os campos e imagens devem ser exibidos corretamente
    Mas observo sobreposição de textos e redimensionamento inadequado das imagens
    E, apesar da falha visual, consigo interagir com os elementos normalmente