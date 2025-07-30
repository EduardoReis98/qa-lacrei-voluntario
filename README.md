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


💻 Como visualizar os testes

https://github.com/EduardoReis98/qa-lacrei-voluntario
Use uma extensão do VS Code como Cucumber (Gherkin) Full Support para melhor visualização dos testes.

📸 Evidências
Veja em prints as capturas de tela dos problemas encontrados, como o bug de quebra de layout mobile.

🧠 Autor
Eduardo Reis
Voluntário QA | Projeto Lacrei Saúde
📧 eduardo.reis1509@gmail.com
[LinkedIn](https://www.linkedin.com/in/eduardo-reis-rodrigues-a6135018b/)