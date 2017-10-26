FactoryGirl.define do
  factory :user do
    name 'Belen'
    email { generate(:email) }
    password '123456'
    gender 'female'
    password_confirmation '123456'
    confirmed_at Time.now
  end
end
