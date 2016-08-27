require 'rails_helper'

describe User, type: :model do
  it 'is able to leave many comments on a picture' do
    is_expected.to have_many :comments
  end
end
