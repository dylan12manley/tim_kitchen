require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
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
