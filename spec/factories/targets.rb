# This will guess the User class
FactoryGirl.define do

  factory :target do
    title 'newtarget'
    area  1000
    latitud '-200'
    longitud '700'
    association :user
    association :topic
  end
end
