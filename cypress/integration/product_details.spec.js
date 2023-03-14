describe('product', () => {
  it('should navigate to product detail page', () => {
 
    cy.visit('/')
    
    cy.get('.products article').first().click()
    
    cy.url().should('include', '/products/')
    cy.get('.product-detail').should('be.visible')
  })
})