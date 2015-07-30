require "rails_helper"
require "pry"

RSpec.describe CommentsController do
  describe "DELETE" do
    it "deletes the comment" do
      user = create(:user)
      sign_in user
      comment = create(:comment, user: user)
      delete :destroy, id: comment.id.to_s
      expect(Comment.where(id: comment.id)).to be_empty
    end

    it "does not delete the comment if it's not the current user" do
      sign_in create(:user)
      comment = create(:comment)
      delete :destroy, id: comment.id.to_s
      expect(Comment.where(id: comment.id)).not_to be_empty
    end
  end
end
