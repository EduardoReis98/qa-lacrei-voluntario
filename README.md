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
Ferramenta: Google Lighthouse
Página testada: /pessoa-usuaria/cadastro
Ambiente: Navegador Chrome - modo Mobile
Data do teste: 29/07/2025

### 📊 Resultados:
Métrica	Resultado	Observação
First Contentful Paint	0.8 s	Excelente
Largest Contentful Paint	5.8 s	❗ Alto — pode impactar a percepção de velocidade
Speed Index	2.8 s	Dentro do aceitável
Total Blocking Time	770 ms	❗ Alto — scripts estão bloqueando a renderização
Cumulative Layout Shift	0.003	Excelente (quase zero deslocamento visual)

### 📌 Conclusão:
A primeira resposta visual da página é rápida, o que é positivo.
No entanto, o tempo até o maior conteúdo ser carregado (5.8s) e o bloqueio por scripts (770ms) indicam que o carregamento total da página ainda é lento para usuários em dispositivos móveis.
Isso pode causar frustração na experiência de cadastro, especialmente em conexões mais lentas ou redes móveis.

### ✅ Recomendações de melhoria (para devs):
Otimizar ou adiar o carregamento de imagens grandes (provavelmente a do topo).
Dividir ou comprimir scripts JavaScript pesados.
Implementar lazy loading onde possível.

---

## 📈 Testes de Desempenho

### 🔍 Cenário Testado:
Simulação de 30 usuários simultâneos acessando a rota de cadastro:
https://paciente-staging.lacreisaude.com.br/cadastro/

### ⚙️ Ferramenta utilizada:
Apache JMeter (executado localmente)

### 🧪 Configuração do Teste:
Threads (Usuários): 30
Ramp-Up: 10 segundos
Loop Count: 1
Requisição: GET para /cadastro/

### 📊 Resultados:
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

### ✅ Conclusão:
A aplicação suporta 30 acessos simultâneos com estabilidade.
Sem erros de requisição detectados.
Apesar da estabilidade, o tempo máximo de resposta (1171 ms) pode ser um ponto de atenção para otimização futura.

---

## 🧠 Autor
Eduardo Reis
Voluntário QA | Projeto Lacrei Saúde
📧 eduardo.reis1509@gmail.com
[LinkedIn](https://www.linkedin.com/in/eduardo-reis-rodrigues-a6135018b/)