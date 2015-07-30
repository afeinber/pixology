FactoryGirl.define do
  factory :comment do
    user
    association :commentable, factory: :image
    content "i am a comment"
  end
end
