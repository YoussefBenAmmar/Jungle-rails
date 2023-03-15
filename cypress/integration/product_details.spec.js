describe('product', () => {
  it('should navigate to product detail page', () => {
 
    // Visit the home page
    cy.visit('/')
    
     // Click on product details
    cy.get('.products article').first().click()
    
    cy.url().should('include', '/products/')
    cy.get('.product-detail').should('be.visible')
  })
})