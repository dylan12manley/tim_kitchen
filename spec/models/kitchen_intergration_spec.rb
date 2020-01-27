require 'rails_helper'

describe('user can sign up', {:type => :feature}) do
  it('creates a user and goes to product page') do
    visit('/signup')
    fill_in('Email', :with => 'email@address.com')
    fill_in('Password', :with => 12345)
    fill_in('Password confirmation', :with => 12345)
    click_on('sign_up')
    expect(page).to have_content("You've successfully signed up!")
  end
end

# describe('fails to create a product path as a user', {:type => :feature}) do
#   it('creates a product and goes to that product page') do
#     visit('/products')
#     click_on('Sign up')
#     fill_in('Email', :with => 'email@address.com')
#     fill_in('Password', :with => 12345)
#     fill_in('Password confirmation', :with => 12345)
#     click_on('sign_up')
#     click_on('Create new product')
#     expect(page).to have_content('You need admin access to do that.')
#   end
# end

describe('create a product path as an admin', {:type => :feature}) do
  it('creates a product and goes to that product page') do
    visit('/products')
    click_on('Sign up')
    fill_in('Email', :with => 'email@address.com')
    fill_in('Password', :with => 12345)
    fill_in('Password confirmation', :with => 12345)
    check('Admin')
    click_on('sign_up')
    visit('/products')
    click_on('Create new product')
    fill_in('Name', :with => 'dehhillnuh')
    fill_in('Cost', :with => 2)
    fill_in('Country of origin', :with => "USA")
    click_on('Create Product')
    expect(page).to have_content('Dehhillnuh')
  end
end

# describe('clears all product paths', {:type => :feature}) do
#   it('creates a product and deleats that product') do
#     visit('/products')
#     click_on('Sign up')
#     fill_in('Email', :with => 'email@address.com')
#     fill_in('Password', :with => 12345)
#     fill_in('Password confirmation', :with => 12345)
#     check('Admin')
#     click_on('Sign up')
#     visit('/products/new')
#     fill_in('Name', :with => 'dehhillnuh')
#     fill_in('Cost', :with => 2)
#     fill_in('Country of origin', :with => "USA")
#     click_on('Create Product')
#     # click_on('Dehhillnuh')
#     click_on('Delete')
#     # click_on('Ok')
#     expect(page).to have_content("Product successfully deleted.")
#   end
# end
#
# describe('create a review path', {:type => :feature}) do
#   it('creates a product with a review and then goes to the product page') do
#     visit('/products')
#     click_on('Sign up')
#     fill_in('Email', :with => 'email@address.com')
#     fill_in('Password', :with => 12345)
#     fill_in('Password confirmation', :with => 12345)
#     check('Admin')
#     click_on('Sign up')
#     visit('/products/new')
#     fill_in('Name', :with => 'dehhillnuh')
#     fill_in('Cost', :with => 2)
#     fill_in('Country of origin', :with => "USA")
#     click_on('Create Product')
#     click_on('Dehhillnuh')
#     click_on('Add an review')
#     fill_in('Author', :with => 'dehhillnuhmy')
#     fill_in('Content body', :with => 'this is the content body this is the content body this is the content body this is the content body this is the content body this is the content body this is the content body this is the content body')
#     fill_in('Rating', :with => "4")
#     click_on('Create Review')
#     expect(page).to have_content('Review successfully created.')
#   end
# end
