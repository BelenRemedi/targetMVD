FactoryGirl.define do
  factory :chat do
    association :topic
    association :receiver, factory: :user
    association :sender, factory: :user
  end
end
