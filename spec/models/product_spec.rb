require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(id: 1, name: "Houseplant")
      @product = Product.new(id: 1, name: "Dragon Plant", price_cents: 30000, quantity: 10, category: @category)
    end

    it "should have valid attribute" do
      expect(@product).to be_valid
    end

    it 'should have the product name' do
      @product.name = nil
      @product.valid? 
      expect(@product.errors.full_messages).to_not be_empty
    end


  it "should have a valid price" do 
    @product.price_cents = nil
    @product.valid?
    expect(@product.errors.full_messages).to_not be_empty
  end

  it "should have valid quanities" do
    @product.quantity = nil
    @product.valid?
    expect(@product.errors.full_messages).to_not be_empty
  end

  it "should have a valid category" do
    @product.category = nil
    @product.valid?
    expect(@product.errors.full_messages).to_not be_empty
  end

end
end
