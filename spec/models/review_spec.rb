require 'rails_helper'

describe Review do
  context '(associations)' do
  it { should belong_to(:product) }
  # it { should belong_to(:user) }
end
context '(validations)' do
  it { should validate_presence_of(:author)}
  it { should validate_presence_of(:content_body)}
  it { should validate_length_of(:content_body).is_at_least(50)}
  it { should validate_length_of(:content_body).is_at_most(250)}
  it { should validate_presence_of(:rating)}
  it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(1)}
end
  it ( "creates a new review") do
    review = Review.create({author: "Johnny", content_body: "this is the content body, it has to be more than fifty charactors and less than two hundred and fifty, this is about long enough", rating: "4" })
    expect(review.author).to(eq("Johnny"))
  end
  it ( "updates a review") do
    review = Review.create({author: "Johnny", content_body: "this is the content body, it has to be more than fifty charactors and less than two hundred and fifty, this is about long enough", rating: "4"})
    review.update({author: "Mr. Appleseed", content_body: "EDIT this is the content body, it has to be more than fifty charactors and less than two hundred and fifty, this is about long enough", rating: "5"})
    expect(review.author()).to(eq("Mr. Appleseed"))
  end
  it ( "destroys a review") do
   review = Review.create({author: "Mr. Appleseed", content_body: "this is the content body, it has to be more than fifty charactors and less than two hundred and fifty, this is about long enough", rating: "4"})
   review.destroy
     expect(Review.all()).to(eq([]))
 end
end
