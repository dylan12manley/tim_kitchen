require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_numericality_of(:rating)}
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
