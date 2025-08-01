import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
const Chance = require('chance');
const chance = new Chance();

let email;
const senha = 'Teste123@';

Given('que estou na página de cadastro', () => {
  cy.visit('/');
  cy.get('section > .ciVyAT > .sc-iHGNWf').click();
});

When('preencho todos os campos obrigatórios corretamente', () => {
  const firstName = chance.first();
  const lastName = chance.last();
  email = chance.email({ domain: "gmail.com" });

  cy.get('#first_name').type(firstName);
  cy.get('#last_name').type(lastName);
  cy.get('#email').type(email);
  cy.get('#email2').type(email);
  cy.get('#password1').type(senha);
  cy.get('#password2').type(senha);
});

When('aceito os termos de uso e que tenho 18 anos', () => {
  cy.get(':nth-child(1) > label > .check-container > span').click();
  cy.get(':nth-child(2) > label > .check-container > span').click();
});

When('clico em cadastrar', () => {
  cy.get('.hWtOGw').click();
});

Then('devo ser redirecionado a página de confirmação de email', () => {
  cy.get('h2')
  cy.get('.sc-ae00c6bf-4 > .sc-bXCLTC').click();
});

Then('sou redirecionado para página de login e tento efetuar o mesmo', () => {
  cy.get('#email').type(email);
  cy.get('#password').type(senha);
  cy.get('form > .sc-bXCLTC').click();
});