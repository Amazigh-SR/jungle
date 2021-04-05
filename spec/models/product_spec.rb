require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should validate when product has all 4 fields present" do
      @category = Category.new(name: "test" )
      @product = Product.new(name: "test product", description: "test description", category: @category, quantity: 10, image: "test url", price: 100)
      expect(@product).to be_valid
    end
    
    it "should not validate when product name is missing" do
      @category = Category.new(name: "test")
      @product = Product.new( description: "test description", category: @category, quantity: 10, image: "test url", price: 100)
      expect(@product).to_not be_valid
    end

     it "should not validate when product price is missing" do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test product", description: "test description", category: @category, quantity: 10, image: "test url")
      expect(@product).to_not be_valid
    end

    it "should not validate when product quantity is missing" do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test product", description: "test description", category: @category,  image: "test url", price: 100)
      expect(@product).to_not be_valid
    end

    it "should validate when product category is missing" do
      @product = Product.new(name: "test product", description: "test description", category: @category, quantity: 10, image: "test url", price: 100)
      expect(@product).to_not be_valid
  end

  end 
   
end
