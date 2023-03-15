describe('Add to cart', () => {
  beforeEach(() => {
    // Visit the home page
    cy.visit('/');
  });

  it('should increase cart count by one when user adds product to cart', () => {

    //click on the add button
    cy.get('.products article').first().within(() => {
     cy.get('.btn').click({force: true})
    })

    cy.get('.end-0').first().within(() => {
      cy.get('.nav-link').should('have.text', ' \n          My Cart (1) ');
    })

  });
});