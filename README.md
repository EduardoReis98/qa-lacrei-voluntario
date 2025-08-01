# 🧪 Projeto de QA - Lacrei Saúde (Voluntariado)

Este repositório contém testes funcionais manuais elaborados para avaliar a usabilidade, acessibilidade e confiabilidade do fluxo de **cadastro de pessoa usuária** na plataforma [Lacrei Saúde](https://paciente-staging.lacreisaude.com.br/).

---

## 📌 Objetivo

Garantir que o processo de cadastro de novos usuários seja funcional, acessível e intuitivo, mesmo em condições adversas (ex: interface mobile, falha no recebimento de e-mail, etc).

---

## ✅ Testes Funcionais

### Linguagem
Todos os testes estão escritos em **Gherkin (Português)**, facilitando o entendimento por todas as partes envolvidas no projeto (negócio, QA, devs e UX).

### Cenários criados
1. **Cadastro com sucesso**

2. **Bug de responsividade no mobile**

3. **E-mail de verificação não recebido mesmo após reenvio**

---

## 🔍 Exemplo de cenário (Gherkin)

```gherkin
Funcionalidade: Cadastro de Pessoa Usuária

  Cenário: Não recebimento do e-mail de verificação mesmo após reenviar
    Dado que completei meu cadastro com sucesso
    E visualizei a mensagem "Estamos quase lá ..."
    Quando clico na opção de reenviar o e-mail de verificação
    Então o sistema deve exibir uma confirmação de que o e-mail foi reenviado
    Mas não recebo o e-mail em minha caixa de entrada ou spam
    Então devo ter acesso fácil a uma opção de contato com o suporte
    E a interface deve informar alternativas claras para resolver o problema
```
---

## 💻 Como visualizar os testes

https://github.com/EduardoReis98/qa-lacrei-voluntario

Use uma extensão do VS Code como Cucumber (Gherkin) Full Support para melhor visualização dos testes.

---

## 📸 Evidências

Veja em prints as capturas de tela dos problemas encontrados, como o bug de quebra de layout mobile.

---

## 🚀 Teste de Desempenho - Página de Cadastro

### 🔍Google Lighthouse

🔍 Cenário Testado:

Página testada: /pessoa-usuaria/cadastro

Ambiente: Navegador Chrome - modo Mobile

Data do teste: 29/07/2025


📊 Resultados:

Métrica	Resultado	Observação

First Contentful Paint	0.8 s	Excelente

Largest Contentful Paint	5.8 s	❗ Alto — pode impactar a percepção de velocidade

Speed Index	2.8 s	Dentro do aceitável

Total Blocking Time	770 ms	❗ Alto — scripts estão bloqueando a renderização

Cumulative Layout Shift	0.003	Excelente (quase zero deslocamento visual)



📌 Conclusão:

A primeira resposta visual da página é rápida, o que é positivo.

No entanto, o tempo até o maior conteúdo ser carregado (5.8s) e o bloqueio por scripts (770ms) indicam que o carregamento total da página ainda é lento para usuários em dispositivos móveis.

Isso pode causar frustração na experiência de cadastro, especialmente em conexões mais lentas ou redes móveis.


✅ Recomendações de melhoria (para devs):

Otimizar ou adiar o carregamento de imagens grandes (provavelmente a do topo).

Dividir ou comprimir scripts JavaScript pesados.

Implementar lazy loading onde possível.



### ⚙️Apache JMeter

🔍 Cenário Testado:

Simulação de 30 usuários simultâneos acessando a rota de cadastro:

https://paciente-staging.lacreisaude.com.br/cadastro/


🧪 Configuração do Teste:

Threads (Usuários): 30

Ramp-Up: 10 segundos

Loop Count: 1

Requisição: GET para /cadastro/


📊 Resultados:

Métrica	Valor

Total de Requisições	30

Tempo Médio de Resposta	510 ms

Tempo Mínimo	175 ms

Tempo Máximo	1171 ms

Desvio Padrão	182.18 ms

Erros (%)	0%

Throughput	2.96 req/segundo

Recebido (KB/s)	48.33

Enviado (KB/s)	0.42

Tamanho Médio da Resposta	16.703 bytes


✅ Conclusão:

A aplicação suporta 30 acessos simultâneos com estabilidade.

Sem erros de requisição detectados.

Apesar da estabilidade, o tempo máximo de resposta (1171 ms) pode ser um ponto de atenção para otimização futura.

---

## 🧪 Testes de Acessibilidade – Tela de Cadastro

### 🦯 1. Teste com NVDA (Windows)

Leitor de tela gratuito para Windows, usado por pessoas com deficiência visual.


✅ Pontos positivos

Todos os campos (nome, e-mail, senha) possuem descrições claras e são lidos corretamente.

Caixas de seleção como "Aceito os termos" e "Consentimento" são focáveis e marcáveis com a tecla espaço.

Labels são anunciados corretamente com os campos, o que torna o formulário compreensível via áudio.


❌ Problemas encontrados

O campo de senha não informa os requisitos esperados (ex.: mínimo de caracteres, letras maiúsculas, símbolos etc.).

Ao tentar se cadastrar com um e-mail já existente, nenhuma mensagem de erro é lida pelo NVDA.

Em caso de erros de preenchimento, nenhuma resposta ou alerta é lida ao usuário, comprometendo totalmente a compreensão do que deu errado.


✅ Sugestões de melhoria

Adicionar uma descrição ARIA (aria-describedby) com os requisitos da senha.

Usar aria-live="assertive" ou role="alert" para que mensagens de erro sejam lidas automaticamente.


### ⌨️ 2. Teste com Teclado (Navegação Sem Mouse)

Simula a navegação de pessoas com deficiência motora ou visual que utilizam apenas o teclado.


✅ Pontos positivos

Todos os campos do formulário e botões são focáveis com Tab.

A ordem de navegação é lógica e fluida, seguindo a estrutura visual da página.

Caixas de seleção funcionam corretamente com a tecla espaço.


❌ Problemas encontrados

Nenhum foco visível ou mensagem de erro é exibido ao cometer erros no formulário.

A tecla Enter em alguns elementos (ex.: botão de cadastro) pode causar o redirecionamento sem apresentar mensagens informativas quando há erro.


✅ Sugestões de melhoria

Adicionar mensagens visuais de erro próximas aos campos e mantê-las visíveis ao foco.

Garantir que ações do Enter em botões não causem navegação inesperada se houver erro.


### 🔍 3. Teste Automatizado com Google Lighthouse

Ferramenta integrada ao Chrome DevTools para avaliação automatizada de boas práticas.


✅ Resultados positivos

Nota de Acessibilidade: 100

Todos os itens da checagem automática foram aprovados, incluindo:

Labels em campos

Contraste entre texto e fundo

Uso correto de ARIA

Hierarquia de headings e landmarks

Navegação por tab correta

Tamanho dos elementos clicáveis adequado


⚠️ Itens que exigem checagem manual (como recomendado pelo Lighthouse)

O foco do usuário não é redirecionado para mensagens de erro.

Controles customizados devem ter papéis ARIA bem definidos.

O campo de senha não indica regras de validação.

O site não fornece feedback textual ou auditivo para ações inválidas.


---

## 🧪 Testes de Responsividade

### 📱 Versão Mobile (até 600px)

Problemas encontrados:

❌ Componentes como caixas de texto e campos de preenchimento estão sobrepostos

❌ Botões pequenos para toque (difícil interação em telas pequenas)

❌ Elementos desalinhados visualmente

✅ Scroll apenas vertical (sem scroll horizontal)

Usabilidade:

⚠️ Com muita dificuldade, é possível acessar os botões e preencher os formulários

✅ Todas as interações funcionam (formulário, botões, navegação)

### 💻 Versão Desktop (>1024px)

✅ Todos os elementos estão alinhados corretamente

✅ Botões e campos funcionam conforme esperado

✅ Layout e usabilidade apropriados

✅ Nenhum erro visual ou funcional identificado

---

## 🐞 **Bugs Encontrados e Melhorias Sugeridas**

| ID | Descrição                                                  | Impacto | Sugestão                                                        |
|----|-------------------------------------------------------------|---------|------------------------------------------------------------------|
| 1  | Campo de senha não explica critérios                        | Médio   | Incluir descrição ARIA (`aria-describedby`) ou texto visível     |
| 2  | Mensagens de erro não são lidas pelo NVDA                   | Alto    | Adicionar `aria-live="assertive"` ou `role="alert"`              |
| 3  | Formulário não mostra erro visual ao falhar                 | Alto    | Exibir mensagens de erro visuais ao lado dos campos              |
| 4  | Reenvio de e-mail falha silenciosamente                     | Alto    | Mostrar mensagem com tempo estimado ou opção de suporte          |
| 5  | Layout mobile quebrado (sobreposição, botões pequenos)      | Médio   | Ajustar o CSS com media queries e melhor dimensionamento         |
| 6  | Tempo de carregamento e bloqueio elevado na performance     | Médio   | Aplicar lazy loading e otimizar scripts JavaScript               |

---

## 🧠 Autor

Eduardo Reis

Voluntário QA | Projeto Lacrei Saúde

📧 eduardo.reis1509@gmail.com

[LinkedIn](https://www.linkedin.com/in/eduardo-reis-rodrigues-a6135018b/)