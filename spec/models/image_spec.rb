require "rails_helper"

RSpec.describe Image do

  before(:each) do
    @user_one = create(:user)
    @user_two = create(:user)
  end

  it "finds images ordered by vote count" do
    image_one = create(:image, user: @user_one)
    image_two = create(:image, user: @user_one)
    image_three = create(:image, user: @user_one)
    create(:vote, votable: image_one, user: @user_one, is_upvote: true)
    create(:vote, votable: image_two, user: @user_one, is_upvote: true)
    create(:vote, votable: image_two, user: @user_two, is_upvote: true)
    expect(Image.hot_right_now[0,3]).to eq([image_two, image_one, image_three]);
  end
end
