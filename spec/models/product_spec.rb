require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "should save a valid product" do
      @category = Category.create(name: "attack")
      product = Product.new(
        name: "blade",
        price: 450,
        quantity: 1,
        category_id: @category.id
      )
      expect(product).to be_valid
    end  

    it "should have a valid name" do
      @category = Category.create(name: "armor")
      product = Product.new(
        name: nil,
        price: 500,
        quantity: 5,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "should have a valid price" do
      @category = Category.create(name: "ability")
      product = Product.new(
        name: "wand",
        price: nil,
        quantity: 2,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "should have a valid quantity" do
      @category = Category.create(name: "support")
      product = Product.new(
        name: "shield",
        price: 475,
        quantity: nil,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "should have a valid category" do
      @category = Category.create(name: "jungle")
      product = Product.new(
        name: "lantern",
        price: 650,
        quantity: 6,
        category_id: nil
      )
      expect(product).to_not be_valid
    end

  end
end
