require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'makes a valid product' do
      @category = Category.new
      @product = Product.new( name: "Test Product", price: 100, quantity: 2, category: @category)
      expect(@product).to be_valid
    end
    it 'is invalid without a name' do
      @category = Category.new
      @product = Product.new( name: nil, price: 100, quantity: 2, category: @category)
      expect(@product).to be_invalid
    end

    it 'is invalid without a price' do
      @category = Category.new
      @product = Product.new( name: "Test Product", price: nil, quantity: 2, category: @category)
      expect(@product).to be_invalid
    end

    it 'is invalid without quantity' do
      @category = Category.new
      @product = Product.new( name: "Test Product", price: 100, quantity: nil, category: @category)
      expect(@product).to be_invalid
    end

    it 'is invalid without a category' do
      @product = Product.new( name: "Test Product", price: 100, quantity: 2, category: nil)
      expect(@product).to be_invalid
    end

  end
end
