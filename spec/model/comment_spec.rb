require 'rails_helper'

describe Comment, type: :model do
  it "is invalid if the rating is more than 1" do
    review = Comment.new(rating: 2)
    expect(review).to have(1).error_on(:rating)
  end
end
