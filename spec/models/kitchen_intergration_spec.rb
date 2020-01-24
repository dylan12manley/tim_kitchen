require 'rails_helper'

describe('create a product path', {:type => :feature}) do
  it('creates a product and goes to that product page') do
    visit('/products')
    click_on('Create new product')
    fill_in('Name', :with => 'tim')
    fill_in('Cost', :with => 2)
    fill_in('Country of origin', :with => "USA")
    click_on('Create Product')
    expect(page).to have_content('Tim')
  end
end

describe('clears all product paths', {:type => :feature}) do
  it('creates a product and deleats that product') do
    visit('/products')
    click_on('Create new product')
    fill_in('Name', :with => 'tim')
    fill_in('Cost', :with => 2)
    fill_in('Country of origin', :with => "USA")
    click_on('Create Product')
    click_on('Tim')
    click_on('Delete')
    # click_on('Ok')
    expect(page).to have_content("Product successfully deleted.")
  end
end

describe('create a review path', {:type => :feature}) do
  it('creates a product with a review and then goes to the product page') do
    visit('/products')
    click_on('Create new product')
    fill_in('Name', :with => 'tim')
    fill_in('Cost', :with => 2)
    fill_in('Country of origin', :with => "USA")
    click_on('Create Product')
    click_on('Tim')
    click_on('Add an review')
    fill_in('Author', :with => 'timmy')
    fill_in('Content body', :with => 'this is the content body this is the content body this is the content body this is the content body this is the content body this is the content body this is the content body this is the content body')
    fill_in('Rating', :with => "4")
    click_on('Create Review')
    expect(page).to have_content('Review successfully created.')
  end
end
