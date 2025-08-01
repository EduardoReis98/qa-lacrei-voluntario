const Chance = require('chance');
const chance = new Chance();
describe('template spec', () => {
  it('passes', () => {

    const firstName = chance.first();
    const lastName = chance.last();
    const email = chance.email({ domain: "gmail.com" });

    cy.visit('https://paciente-staging.lacreisaude.com.br/')
    cy.get('section > .ciVyAT > .sc-iHGNWf').click()
    cy.get('#first_name').type(firstName)
    cy.get('#last_name').type(lastName)
    cy.get('#email').type(email)
    cy.get('#email2').type(email)
    cy.get('#password1').type('Teste123@')
    cy.get('#password2').type('Teste123@')
    cy.get(':nth-child(1) > label > .check-container > span').click()
    cy.get(':nth-child(2) > label > .check-container > span').click()
    cy.get('.hWtOGw').click()
    cy.get('h2')
    cy.get('.sc-ae00c6bf-4 > .sc-bXCLTC').click()
    cy.get('#email').type(email)
    cy.get('#password').type('Teste123@')
    cy.get('form > .sc-bXCLTC').click()

  })
})