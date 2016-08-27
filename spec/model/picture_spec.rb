require 'spec_helper'

describe Picture, type: :model do
  it 'is not valid with a title of less than three characters' do
    picture = Picture.new(title: "ar")
    expect(picture).to have(1).error_on(:title)
    expect(picture).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Picture.create(title: "The Armadillo")
    picture = Picture.new(title: "The Armadillo")
    expect(picture).to have(1).error_on(:title)
  end
end
