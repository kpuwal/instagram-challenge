require 'spec_helper'

describe Picture, type: :model do
  it 'is not valid with a title of less than three characters' do
    picture = Picture.new(title: "kf")
    expect(picture).to have(1).error_on(:title)
    expect(picture).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Picture.create(title: "Moe's Tavern")
    picture = Picture.new(title: "Moe's Tavern")
    expect(picture).to have(1).error_on(:title)
  end
end
