require 'rails_helper'

describe Product do
  context '(associations)' do
  it { should have_many(:reviews) }
end
context '(validations)' do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:cost)}
  it { should validate_presence_of(:country_of_origin)}
end
context '(scopes)' do
  it '.most_recent returns the 3 most recent products' do
    product_one = Product.create(name: 'apple', cost: 1, country_of_origin: 'USA')
    product_two = Product.create(name: 'orange', cost: 1, country_of_origin: 'USA')
    product_three = Product.create(name: 'banana', cost: 1, country_of_origin: 'USA')
    product_four = Product.create(name: 'candy', cost: 1, country_of_origin: 'Canada')
    expect(Product.most_recent).to eq [product_four, product_three, product_two]
  end
  it '.local_products returns all products with USA as country of origin' do
    product_one = Product.create(name: 'apple', cost: 1, country_of_origin: 'USA')
    product_two = Product.create(name: 'orange', cost: 1, country_of_origin: 'USA')
    product_three = Product.create(name: 'banana', cost: 1, country_of_origin: 'USA')
    product_four = Product.create(name: 'candy', cost: 1, country_of_origin: 'Canada')
    expect(Product.local_products).to eq [ product_one, product_two, product_three]
  end
end
  it("titleizes the name of an product") do
    product = Product.create({name: "cripps Pink lady", cost: 1.50, country_of_origin: "Canada"})
    expect(product.name()).to(eq("Cripps Pink Lady"))
  end
  it ( "creates a new product") do
    product = Product.create({name: "Apple", cost: 1.10, country_of_origin: "USA" })
    expect(product.name).to(eq("Apple"))
  end
  it ( "updates a product") do
    product = Product.create({name: "Apple", cost: 1.10, country_of_origin: "USA"})
    product.update({name: "Cripps Pink Lady", cost: 1.50, country_of_origin: "Canada"})
    expect(product.name()).to(eq("Cripps Pink Lady"))
  end
  it ( "destroys a product") do
   product = Product.create({name: "Apple", cost: 1.10, country_of_origin: "USA"})
   product.destroy
     expect(Product.all()).to(eq([]))
 end
end
